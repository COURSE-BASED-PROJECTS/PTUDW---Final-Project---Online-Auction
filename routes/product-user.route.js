import express, {request} from "express";
import productModel from "../models/product.model.js";
import accountModel from "../models/account.model.js";
import productFavoriteModel from "../models/productFavorite.model.js";
import productOnAuctionModel from "../models/productOnAuction.model.js";
import historybidModel from "../models/historybid.model.js";
import lockAuctionAccountModel from "../models/lockAuction.model.js";
import moment from "moment";
import sendMail from "../utils/sendMail.js";


const router = express.Router();

router.get('/byCat/:id', async function (req, res) {
    const CatIDNext = req.params.id || 0;

    //---
    const limit = 6;
    const page = req.query.page || 1;
    const offset = (page - 1) * limit;

    const total = await productModel.countByCatIDNext(CatIDNext);
    let nPages = Math.floor(total / limit);
    if (total % limit > 0) nPages++;

    const pageNumbers = [];
    for (let i = 1; i <= nPages; i++) {
        pageNumbers.push({
            value: i,
            isCurrent: +page === i
        });
    }

    const list = await productModel.findPageByCatIDNext(CatIDNext, limit, offset);
    let listID = '';
    for (let i = 0; i < list.length; i++) {
        listID += list[i].ProID + ' ';
    }
    listID = listID.trim()
    //----

    for (const p of list) {
        p.auth = req.session.auth;
        p.isSold = await productModel.isSold(p.ProID);
        p.isNew = await productModel.isNew(p.ProID, 10);
        if(req.session.auth)
            p.isOnAuction = await productOnAuctionModel.isOnAuction(req.session.authAccount.username,p.ProID);
    }

    let found = false;
    for (const c of res.locals.lcCategories) {
        for (const tmp of c.listsub) {
            if (tmp.CatIDNext === +CatIDNext) {
                c.isActive = true;
                tmp.isActive = true;
                found = true;
                break;
            }
        }

        if (found)
            break;
    }
    if (req.session.auth) {
        const username = req.session.authAccount.username;
        for (const p of list) {
            p.isLiked = await productFavoriteModel.isFavorite(username, p.ProID);
        }
    }
    res.render('vwCategory/category', {
        layout: 'main',
        list,
        listID,
        isEmpty: list.length === 0,
        pageNumbers,
        pageNext: {
            page: +page + 1,
            isVisible: (+page === 1 && nPages === 1) ? false : (+page === nPages ? false : true),
        },
        pagePrev: {
            page: +page - 1,
            isVisible: (+page === 1) ? false : true,
        },
    });
});

router.get('/detail/:id', async function (req, res) {
    const ProName = req.params.name;
    const ProID = req.params.id;
    const product = await productModel.findByProID(ProID);
    const dateEnd = moment(product[0].DateEnd, 'DD/MM/YYYY HH:mm').format("YYYY-MM-DD HH:mm");
    const now = moment().format("YYYY-MM-DD HH:mm");
    const isSold = await productModel.isSold(ProID);
    const isExpired = moment(now).isAfter(dateEnd) || isSold;
    const listBid = await historybidModel.findListBidder(ProID);
    const relatives = await productModel.findRelatedProducts(ProID, product[0].CatIDNext);
    const seller = await accountModel.findByUsername(product[0].Seller);
    const bidderFlag = await accountModel.findByUsername(product[0].Bidder);
    let isLockAuction = false;
    let isRightSeller = false;
    let isAuth = false;
    let isLiked = false;
    let point_percent_bidder = 0;
    let point_percent_seller = 0;

    if (req.session.auth) {
        isAuth = await productModel.isAuthProduct(ProID, req.session.authAccount.username);
        isLockAuction = await lockAuctionAccountModel.isLock(req.session.authAccount.username, ProID);

        if (product[0].Bidder === req.session.authAccount.username) {
            product[0].isAuction = false;
        } else {
            product[0].isAuction = true;
        }

        if (product[0].Seller === req.session.authAccount.username)
            isRightSeller = true;

        const username = req.session.authAccount.username;
        const account_bidder = await accountModel.findByUsername(product[0].Bidder);
        const account_seller = await accountModel.findByUsername(product[0].Seller);

        isLiked = await productFavoriteModel.isFavorite(username, ProID);

        if(account_bidder === null)
            point_percent_bidder = 0;
        else if(+account_bidder.sumBid === 0){
            point_percent_bidder = 0;
        } else if(account_bidder.sumBid>0){
            if(account_bidder.point === 0)
                point_percent_bidder = account_bidder.sumBid*-100;
            else
                point_percent_bidder = ((account_bidder.point)*100/account_bidder.sumBid).toFixed();
        }
        if(+account_seller.sumBid === 0){
            point_percent_seller = 0;
        } else if(account_seller.sumBid>0){
            if(account_seller.point === 0)
                point_percent_seller = account_seller.sumBid*-100;
            else
                point_percent_seller = ((account_seller.point)*100/account_seller.sumBid).toFixed();
        }


    }

    if (product === null) {
        return res.redirect('/');
    }



    res.render('vwCategory/product', {
        layout: 'SignUp_Login',
        product: product[0],
        isAuth,
        isLiked,
        isLockAuction,
        isExpired,
        listBid,
        isHasBidder: listBid.length !== 0,
        relatedProducts: relatives,
        isRightSeller,
        seller,
        bidderFlag,
        point_percent_bidder,
        point_percent_seller
    });
});

router.post('/update/:id', async function (req, res) {
    const ProID = req.params.id;
    const product = await productModel.findByProID(ProID);
    const now = moment().format("DD-MM-YYYY HH:mm:ss");

    await productModel.updateDescription(ProID, product[0].Description, now, req.body.FullDesc)

    res.redirect('/product/detail/' + ProID);

});

router.get('/infoProduct/:id', async function (req, res) {
    const id = req.params.id;
    const product = await productModel.findByProID(id);
    const account = await accountModel.findByUsername(req.session.authAccount.username);
    const dateEnd = moment(product[0].DateEnd, 'DD/MM/YYYY HH:mm').format("YYYY-MM-DD HH:mm");
    const now = moment().format("YYYY-MM-DD HH:mm");
    const isSold = await productModel.isSold(id);
    const isExpired = moment(now).isAfter(dateEnd) || isSold;

    product[0].isExpired = isExpired;

    if (!account.isActive) {
        res.json(false);
    }else if(product[0].isVerify) {
        if(+account.sumBid === 0) {
            res.json("lowPoint");
            return;
        }else if((+account.point*1.0 / +account.sumBid) < 0.8) {
            res.json("lowPoint");
            return;
        }
        res.json(product[0]);
    }else {
        res.json(product[0]);
    }

});

router.post('/setPrice', async function (req, res) {
    const id = req.body.id;
    const product = await productModel.findByProID(id);
    const account = await accountModel.findByUsername(req.session.authAccount.username);

    const dateEnd = moment(product[0].DateEnd, 'DD/MM/YYYY HH:mm').format("YYYY-MM-DD HH:mm");
    const now = moment().format("YYYY-MM-DD HH:mm");
    const isSold = await productModel.isSold(id);
    const isExpired = moment(now).isAfter(dateEnd) || isSold;
    const priceBid = req.body.number;
    const username = req.session.authAccount.username;

    if (isExpired) {
        res.redirect('/product/detail/' + id);
    } else {
        if (+priceBid >= +product[0].PriceWin) {
            const historybid = {
                ProIDHistory: id,
                BidderHistory: username,
                PriceBid: priceBid,
                PriceWinAll: product[0].PriceWin,
                PriceStart: product[0].PriceCurrent,
            }

            await historybidModel.addHistory(historybid, id, product[0].BidderCount);
            await productModel.updateBidderFlag(username, id);
            await productModel.updateSuccessul(username, product[0].PriceWin, id);
            // g???i mail ng?????i b??n
            const accountSeller = await accountModel.findByUsername(product[0].Seller);
            const contentSeller = "S???n ph???m: " + product[0].ProName
                + " c???a b???n ????ng v??o l??c: " + product[0].DateStart + " ???? c?? ng?????i mua. Vui l??ng li??n h??? v???i Bidder " +
                product[0].Bidder + " ????? giao d???ch s???n ph???m."
                + " C??m ??n b???n ???? ????ng s???n ph???m tr??n h??? th???ng c???a ch??ng t??i."
            sendMail(accountSeller.email, contentSeller);
            // g???i mail ng?????i th???ng
            if (product[0].Bidder !== null) {
                const accountBidder = await accountModel.findByUsername(product[0].Bidder);
                const contentBidder = "B???n ???? th???ng s???n ph???m: " + product[0].ProName
                    + " ???????c ????ng v??o l??c: " + product[0].DateStart + " c???a Seller: " +
                    product[0].Seller + ". Vui l??ng li??n h??? v???i Seller ????? giao d???ch s???n ph???m. C??m ??n b???n ???? giao d???ch s???n ph???m tr??n h??? th???ng c???a ch??ng t??i."
                sendMail(accountBidder.email, contentBidder);
            }
            await productModel.updateEmailed(product[0].ProID);

        } else {
            const priceBidFlag = await historybidModel.getPriceBid(product[0].Bidder, id);
            if (+priceBid <= +priceBidFlag) {
                const historybid = {
                    ProIDHistory: id,
                    BidderHistory: username,
                    PriceBid: priceBid,
                    PriceWinAll: priceBid,
                    PriceStart: product[0].PriceCurrent,
                }

                await historybidModel.addHistory(historybid, id, product[0].BidderCount);
                await productModel.updateCurrentPrice(id, priceBid)

                if (product[0].Bidder !== null) {
                    // email ng?????i b??n gi?? thay ?????i
                    const accountSeller = await accountModel.findByUsername(product[0].Seller);
                    const contentSeller = "S???n ph???m: " + product[0].ProName
                        + " c???a b???n ????ng v??o l??c: " + product[0].DateStart + " ???? ???????c t??ng gi??." +
                        " Gi?? hi???n t???i l??: " + product[0].PriceCurrent
                        + ". Vui l??ng ????ng nh???p h??? th???ng ????? xem chi ti???t."
                    sendMail(accountSeller.email, contentSeller);

                    // email ng?????i ??ang gi??? gi?? (C???p nh???t gi?? m???i)
                    const accountBidder = await accountModel.findByUsername(product[0].Bidder);
                    const contentBidder = "Gi?? s???n ph???m: " + product[0].ProName
                        + " ???????c ????ng v??o l??c: " + product[0].DateStart + " c???a Seller: " +
                        product[0].Seller + " ???? t??ng l??n. Gi?? hi???n t???i l??: " + product[0].PriceCurrent
                        + ". B???n l?? ng?????i ??ang gi??? gi?? s???n ph???m n??y, vui l??ng v??o h??? th???ng ????? xem chi ti???t." +
                        "Ch??ng t??i s??? g???i email cho b???n khi gi?? s???n ph???m thay ?????i. C??m ??n b???n ???? tham gia ?????u gi?? tr??n h??? th???ng c???a ch??ng t??i."
                    sendMail(accountBidder.email, contentBidder);

                    // email ng?????i ?????t nh??ng ko v?????t qua ng gi??? gi??
                    const contentNewBidder = "B???n ???? ?????t gi?? kh??ng th??nh c??ng cho s???n ph???m: " + product[0].ProName
                        + " ???????c ????ng v??o l??c: " + product[0].DateStart + " c???a Seller: " +
                        product[0].Seller + ". R???t ti???t gi?? c???a b???n ????a ra kh??ng chi???n th???ng ???????c ng?????i ch??i kh??c."
                        + "N???u b???n c??n h???ng th?? v???i s???n ph???m n??y, vui l??ng v??o h??? th???ng ????? ?????u gi?? ti???p n??o." +
                        " C??m ??n b???n ???? tham gia ?????u gi?? tr??n h??? th???ng c???a ch??ng t??i."
                    sendMail(account.email, contentNewBidder);
                }

            } else {
                const priceWinAll = +priceBidFlag === 0 ? product[0].firstPrice : +priceBidFlag + +product[0].stepPrice;

                const historybid = {
                    ProIDHistory: id,
                    BidderHistory: username,
                    PriceBid: priceBid,
                    PriceWinAll: priceWinAll,
                    PriceStart: product[0].PriceCurrent,
                }
                // email ng?????i ??ang gi??? gi?? c?? tr?????c khi ?????i ng?????i gi??? gi?? m???i
                if (product[0].Bidder !== product[0].Seller && product[0].Bidder !== null) {
                    const accountOldBidder = await accountModel.findByUsername(product[0].Bidder);
                    const contentOldBidder = "B???n kh??ng c??n gi??? gi?? cho s???n ph???m: " + product[0].ProName
                        + " ???????c ????ng v??o l??c: " + product[0].DateStart + " c???a Seller: " +
                        product[0].Seller + ". R???t ti???t gi?? c???a b???n ???? b??? ng?????i ch??i kh??c v?????t qua."
                        + "N???u b???n c??n h???ng th?? v???i s???n ph???m n??y, vui l??ng v??o h??? th???ng ????? ?????u gi?? ti???p n??o." +
                        " C??m ??n b???n ???? tham gia ?????u gi?? tr??n h??? th???ng c???a ch??ng t??i."
                    sendMail(accountOldBidder.email, contentOldBidder);
                }
                await historybidModel.addHistory(historybid, id, product[0].BidderCount);
                await productModel.updateCurrentPrice(id, priceWinAll)
                await productModel.updateBidderFlag(username, id)

                // email ng?????i b??n gi?? thay ?????i
                const accountSeller = await accountModel.findByUsername(product[0].Seller);
                const contentSeller = "S???n ph???m: " + product[0].ProName
                    + " c???a b???n ????ng v??o l??c: " + product[0].DateStart + " ???? ???????c t??ng gi??." +
                    " Gi?? hi???n t???i l??: " + product[0].PriceCurrent
                    + ". Vui l??ng ????ng nh???p h??? th???ng ????? xem chi ti???t."
                sendMail(accountSeller.email, contentSeller);

                // email ng?????i m???i ?????t gi?? th??nh c??ng
                if (product[0].Bidder !== null) {
                    const contentBidder = "B???n ???? ?????t gi?? th??nh c??ng cho s???n ph???m: " + product[0].ProName
                        + " ???????c ????ng v??o l??c: " + product[0].DateStart + " c???a Seller: " +
                        product[0].Seller + ". Gi?? c???a b???n ????a ra ??ang cao h??n nh???ng ng?????i ch??i kh??c."
                        + "B???n l?? ng?????i ??ang gi??? gi?? s???n ph???m n??y, vui l??ng v??o h??? th???ng ????? xem chi ti???t." +
                        "Ch??ng t??i s??? g???i email cho b???n khi gi?? s???n ph???m thay ?????i. C??m ??n b???n ???? tham gia ?????u gi?? tr??n h??? th???ng c???a ch??ng t??i."
                    sendMail(account.email, contentBidder);
                }
            }
        }

        if(product[0].renewal){
            if(productModel.isNearlyExpired(id)){
                productModel.addMoreTime(id,product[0].DateEnd);
            }
        }

        const url = req.headers.referer || '/';
        res.redirect(url);
    }

});

router.post('/buynow/:id', async function (req, res) {
    const id = req.params.id;
    const product = await productModel.findByProID(id);
    const username = req.session.authAccount.username;

    const historybid = {
        ProIDHistory: id,
        BidderHistory: username,
        PriceBid: product[0].PriceWin,
        PriceWinAll: product[0].PriceWin,
        PriceStart: product[0].PriceCurrent,
        isSuccessful: 1,
    }

    await historybidModel.addHistory(historybid, id, product[0].BidderCount);
    await productModel.updateBidderFlag(username, id);
    await productModel.updateSuccessul(username, product[0].PriceWin, id);

    // g???i mail ng?????i th???ng , ng?????i b??n
    if (product[0].Bidder !== null) {
        const accountSeller = await accountModel.findByUsername(product[0].Seller);
        const contentSeller = "S???n ph???m: " + product[0].ProName
            + " c???a b???n ????ng v??o l??c: " + product[0].DateStart + " ???? c?? ng?????i mua. Vui l??ng li??n h??? v???i Bidder " +
            product[0].Bidder + " ????? giao d???ch s???n ph???m."
            + " C??m ??n b???n ???? ????ng s???n ph???m tr??n h??? th???ng c???a ch??ng t??i."
        sendMail(accountSeller.email, contentSeller);

        const accountBidder = await accountModel.findByUsername(product[0].Bidder);
        const contentBidder = "B???n ???? th???ng s???n ph???m: " + product[0].ProName
            + " ???????c ????ng v??o l??c: " + product[0].DateStart + " c???a Seller: " +
            product[0].Seller + ". Vui l??ng li??n h??? v???i Seller ????? giao d???ch s???n ph???m. " +
            "C??m ??n b???n ???? giao d???ch s???n ph???m tr??n h??? th???ng c???a ch??ng t??i."

        sendMail(accountBidder.email, contentBidder);
    }

    await productModel.updateEmailed(product[0].ProID);

    res.redirect('/info/wonProduct');
});

router.post('/del/:username', async function (req, res) {
    const username = req.params.username;
    const ProID = req.body.id;
    let product = await productModel.findByProID(ProID)

    // t??m username ng gi??? gi?? hi???n t???i - 1
    const currentBidder = product[0].Bidder;

    const historybidDel = await historybidModel.findHistorybidByUsername(username, ProID);

    let isFirst = false;
    if (await historybidModel.checkFirst(username, ProID)) {
        isFirst = true;
    }

    await productModel.updateIsAllowed(ProID, username);
    let ListBidderAfterDel = await historybidModel.findListBidderAfterDel(ProID);

    await historybidModel.filterListAfterDel(ListBidderAfterDel, historybidDel.PriceBid, ProID
        , product[0].stepPrice, isFirst, product[0].firstPrice);
    ListBidderAfterDel = await historybidModel.findListBidderAfterDel(ProID);

    if (ListBidderAfterDel.length === 0) {
        await productModel.updateBidderFlag(null, ProID);
        await productModel.updateCurrentPrice(ProID, +product[0].firstPrice);
    } else if (ListBidderAfterDel.length === 1) {
        await productModel.updateBidderFlag(ListBidderAfterDel[0].BidderHistory, ProID);
        await productModel.updateCurrentPrice(ProID, +product[0].firstPrice);
        await productModel.updatePriceWinAll(ProID, ListBidderAfterDel[0].BidderHistory, +product[0].firstPrice);
    } else {
        const length = ListBidderAfterDel.length;
        await productModel.updateBidderFlag(ListBidderAfterDel[0].BidderHistory, ProID,
            +ListBidderAfterDel[0].PriceWinAll);
        await productModel.updateCurrentPrice(ProID, +ListBidderAfterDel[0].PriceWinAll);
    }

    const lockAccount = {
        id: username,
        product: ProID
    }

    await lockAuctionAccountModel.addLockAuctionAccount(lockAccount);


    // t??m username ng gi??? gi?? sau khi x??a - 2
    product = await productModel.findByProID(ProID);
    const newBidder = product[0].Bidder;

    //TH1: 1===2 -> ng?????i gi??? gi?? kh??ng b??? x??a
    // g???i email cho ng b??? x??a ???? b??? t??? ch???i t??? seller
    if (currentBidder === newBidder){
        const accountCancel = await accountModel.findByUsername(username);
        const content = "B???n ???? b??? t??? ch???i ?????u gi?? s???n ph???m: " + product[0].ProName
            + " ???????c ????ng v??o l??c: " + product[0].DateStart + " c???a Seller: " +
            product[0].Seller +
            ". C??m ??n b???n ???? giao d???ch s???n ph???m tr??n h??? th???ng c???a ch??ng t??i."
        sendMail(accountCancel.email, content);
    } else {
        // TH2: 1 kh??c 2
        // g???i email cho ng ??ang gi??? gi?? c?? ???? b??? lock ?????u gi?? sp n??y
        const accountCurrent = await accountModel.findByUsername(currentBidder);
        const content = "B???n ???? b??? t??? ch???i ?????u gi?? s???n ph???m: " + product[0].ProName
            + " ???????c ????ng v??o l??c: " + product[0].DateStart + " c???a Seller: " +
            product[0].Seller + ". B???n kh??ng th??? ti???p t???c ?????u gi?? s???n ph???m n??y. " +
            "C??m ??n b???n ???? giao d???ch s???n ph???m tr??n h??? th???ng c???a ch??ng t??i."
        sendMail(accountCurrent.email, content);

        // g???i email cho ng gi??? gi?? m???i.
        if (product[0].Bidder !== null) {
            const accountNew = await accountModel.findByUsername(newBidder);
            const contentNew = "Gi?? s???n ph???m: " + product[0].ProName
                + " ???????c ????ng v??o l??c: " + product[0].DateStart + " c???a Seller: " +
                product[0].Seller + " hi???n t???i l??: " + product[0].PriceCurrent
                + ". B???n l?? ng?????i ??ang gi??? gi?? s???n ph???m n??y, vui l??ng v??o h??? th???ng ????? xem chi ti???t." +
                "Ch??ng t??i s??? g???i email cho b???n khi gi?? s???n ph???m thay ?????i. C??m ??n b???n ???? tham gia ?????u gi?? tr??n h??? th???ng c???a ch??ng t??i."
            sendMail(accountNew.email, contentNew);
        }
    }



    res.redirect('/product/detail/' + ProID);
});


export default router
