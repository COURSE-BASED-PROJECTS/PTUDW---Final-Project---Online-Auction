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
    const dateEnd = moment(product[0].DateEnd, 'DD/MM/YYYY hh:mm').format("YYYY-MM-DD hh:mm");
    const now = moment().format("YYYY-MM-DD hh:mm");
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
        isLiked = await productFavoriteModel.isFavorite(username, ProID);

    }

    if (product === null) {
        return res.redirect('/');
    }

    res.render('vwCategory/product', {
        layout: 'SignUp_login',
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
    const dateEnd = moment(product[0].DateEnd, 'DD/MM/YYYY hh:mm').format("YYYY-MM-DD hh:mm");
    const now = moment().format("YYYY-MM-DD hh:mm");
    const isSold = await productModel.isSold(id);
    const isExpired = moment(now).isAfter(dateEnd) || isSold;

    product[0].isExpired = isExpired;

    if (!account.isActive) {
        res.json(false);
    } else if (product[0].isVerify) {
        if (+account.point / +account.sumBid < 0.8) {
            res.json("lowPoint")
        }
        res.json(product[0]);
    } else {
        res.json(product[0]);
    }

});

router.post('/setPrice', async function (req, res) {
    const id = req.body.id;
    const product = await productModel.findByProID(id);
    const account = await accountModel.findByUsername(req.session.authAccount.username);

    const dateEnd = moment(product[0].DateEnd, 'DD/MM/YYYY hh:mm').format("YYYY-MM-DD hh:mm");
    const now = moment().format("YYYY-MM-DD hh:mm");
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
            // gửi mail người bán
            const accountSeller = await accountModel.findByUsername(product[0].Seller);
            const contentSeller = "Sản phẩm: " + product[0].ProName
                + " của bạn đăng vào lúc: " + product[0].DateStart + " đã có người mua. Vui lòng liên hệ với Bidder " +
                product[0].Bidder + " để giao dịch sản phẩm."
                + " Cám ơn bạn đã đăng sản phẩm trên hệ thống của chúng tôi."
            sendMail(accountSeller.email, contentSeller);
            // gửi mail người thắng
            const accountBidder = await accountModel.findByUsername(product[0].Bidder);
            const contentBidder = "Bạn đã thắng sản phẩm: " + product[0].ProName
                + " được đăng vào lúc: " + product[0].DateStart + " của Seller: " +
                product[0].Seller + ". Vui lòng liên hệ với Seller để giao dịch sản phẩm. Cám ơn bạn đã giao dịch sản phẩm trên hệ thống của chúng tôi."
            sendMail(accountBidder.email, contentBidder);

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

                // email người bán giá thay đổi
                const accountSeller = await accountModel.findByUsername(product[0].Seller);
                const contentSeller = "Sản phẩm: " + product[0].ProName
                    + " của bạn đăng vào lúc: " + product[0].DateStart + " đã được tăng giá." +
                    " Giá hiện tại là: " + product[0].PriceCurrent
                    + ". Vui lòng đăng nhập hệ thống để xem chi tiết."
                sendMail(accountSeller.email, contentSeller);

                // email người đang giữ giá (Cập nhật giá mới)
                const accountBidder = await accountModel.findByUsername(product[0].Bidder);
                const contentBidder = "Giá sản phẩm: " + product[0].ProName
                    + " được đăng vào lúc: " + product[0].DateStart + " của Seller: " +
                    product[0].Seller + " đã tăng lên. Giá hiện tại là: " + product[0].PriceCurrent
                    + ". Bạn là người đang giữ giá sản phẩm này, vui lòng vào hệ thống để xem chi tiết." +
                    "Chúng tôi sẽ gửi email cho bạn khi giá sản phẩm thay đổi. Cám ơn bạn đã tham gia đấu giá trên hệ thống của chúng tôi."
                sendMail(accountBidder.email, contentBidder);

                // email người đặt nhưng ko vượt qua ng giữ giá
                const contentNewBidder = "Bạn đã đặt giá không thành công cho sản phẩm: " + product[0].ProName
                    + " được đăng vào lúc: " + product[0].DateStart + " của Seller: " +
                    product[0].Seller + ". Rất tiết giá của bạn đưa ra không chiến thắng được người chơi khác."
                    + "Nếu bạn còn hứng thú với sản phẩm này, vui lòng vào hệ thống để đấu giá tiếp nào." +
                    " Cám ơn bạn đã tham gia đấu giá trên hệ thống của chúng tôi."
                sendMail(account.email, contentNewBidder);

            } else {
                const priceWinAll = +priceBidFlag === 0 ? product[0].firstPrice : +priceBidFlag + +product[0].stepPrice;

                const historybid = {
                    ProIDHistory: id,
                    BidderHistory: username,
                    PriceBid: priceBid,
                    PriceWinAll: priceWinAll,
                    PriceStart: product[0].PriceCurrent,
                }
                // email người đang giữ giá cũ trước khi đổi người giữ giá mới
                if (product[0].Bidder !== product[0].Seller) {
                    const accountOldBidder = await accountModel.findByUsername(product[0].Bidder);
                    const contentOldBidder = "Bạn không còn giữ giá cho sản phẩm: " + product[0].ProName
                        + " được đăng vào lúc: " + product[0].DateStart + " của Seller: " +
                        product[0].Seller + ". Rất tiết giá của bạn đã bị người chơi khác vượt qua."
                        + "Nếu bạn còn hứng thú với sản phẩm này, vui lòng vào hệ thống để đấu giá tiếp nào." +
                        " Cám ơn bạn đã tham gia đấu giá trên hệ thống của chúng tôi."
                    sendMail(accountOldBidder.email, contentOldBidder);
                }
                await historybidModel.addHistory(historybid, id, product[0].BidderCount);
                await productModel.updateCurrentPrice(id, priceWinAll)
                await productModel.updateBidderFlag(username, id)

                // email người bán giá thay đổi
                const accountSeller = await accountModel.findByUsername(product[0].Seller);
                const contentSeller = "Sản phẩm: " + product[0].ProName
                    + " của bạn đăng vào lúc: " + product[0].DateStart + " đã được tăng giá." +
                    " Giá hiện tại là: " + product[0].PriceCurrent
                    + ". Vui lòng đăng nhập hệ thống để xem chi tiết."
                sendMail(accountSeller.email, contentSeller);

                // email người mới đặt giá thành công
                const contentBidder = "Bạn đã đặt giá thành công cho sản phẩm: " + product[0].ProName
                    + " được đăng vào lúc: " + product[0].DateStart + " của Seller: " +
                    product[0].Seller + ". Giá của bạn đưa ra đang cao hơn những người chơi khác."
                    + "Bạn là người đang giữ giá sản phẩm này, vui lòng vào hệ thống để xem chi tiết." +
                    "Chúng tôi sẽ gửi email cho bạn khi giá sản phẩm thay đổi. Cám ơn bạn đã tham gia đấu giá trên hệ thống của chúng tôi."
                sendMail(account.email, contentBidder);
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

    // gửi mail người thắng , người bán
    const accountSeller = await accountModel.findByUsername(product[0].Seller);
    const contentSeller = "Sản phẩm: " + product[0].ProName
        + " của bạn đăng vào lúc: " + product[0].DateStart + " đã có người mua. Vui lòng liên hệ với Bidder " +
        product[0].Bidder + " để giao dịch sản phẩm."
        + " Cám ơn bạn đã đăng sản phẩm trên hệ thống của chúng tôi."
    sendMail(accountSeller.email, contentSeller);
    const accountBidder = await accountModel.findByUsername(product[0].Bidder);
    const contentBidder = "Bạn đã thắng sản phẩm: " + product[0].ProName
        + " được đăng vào lúc: " + product[0].DateStart + " của Seller: " +
        product[0].Seller + ". Vui lòng liên hệ với Seller để giao dịch sản phẩm. " +
        "Cám ơn bạn đã giao dịch sản phẩm trên hệ thống của chúng tôi."
    sendMail(accountBidder.email, contentBidder);

    await productModel.updateEmailed(product[0].ProID);

    res.redirect('/info/wonProduct');
});

router.post('/del/:username', async function (req, res) {
    const username = req.params.username;
    const ProID = req.body.id;
    let product = await productModel.findByProID(ProID)

    // tìm username ng giữ giá hiện tại - 1
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


    // tìm username ng giữ giá sau khi xóa - 2
    product = await productModel.findByProID(ProID);
    const newBidder = product[0].Bidder;

    //TH1: 1===2 -> người giữ giá không bị xóa
    // gửi email cho ng bị xóa đã bị từ chối từ seller
    if (currentBidder === newBidder){
        const accountCancel = await accountModel.findByUsername(username);
        const content = "Bạn đã bị từ chối đấu giá sản phẩm: " + product[0].ProName
            + " được đăng vào lúc: " + product[0].DateStart + " của Seller: " +
            product[0].Seller +
            ". Cám ơn bạn đã giao dịch sản phẩm trên hệ thống của chúng tôi."
        sendMail(accountCancel.email, content);
    } else {
        // TH2: 1 khác 2
        // gửi email cho ng đang giữ giá cũ đã bị lock đấu giá sp này
        const accountCurrent = await accountModel.findByUsername(currentBidder);
        const content = "Bạn đã bị từ chối đấu giá sản phẩm: " + product[0].ProName
            + " được đăng vào lúc: " + product[0].DateStart + " của Seller: " +
            product[0].Seller + ". Bạn không thể tiếp tục đấu giá sản phẩm này. " +
            "Cám ơn bạn đã giao dịch sản phẩm trên hệ thống của chúng tôi."
        sendMail(accountCurrent.email, content);

        // gửi email cho ng giữ giá mới.
        const accountNew = await accountModel.findByUsername(newBidder);
        const contentNew = "Giá sản phẩm: " + product[0].ProName
            + " được đăng vào lúc: " + product[0].DateStart + " của Seller: " +
            product[0].Seller + " hiện tại là: " + product[0].PriceCurrent
            + ". Bạn là người đang giữ giá sản phẩm này, vui lòng vào hệ thống để xem chi tiết." +
            "Chúng tôi sẽ gửi email cho bạn khi giá sản phẩm thay đổi. Cám ơn bạn đã tham gia đấu giá trên hệ thống của chúng tôi."
        sendMail(accountNew.email, contentNew);
    }



    res.redirect('/product/detail/' + ProID);
});


export default router