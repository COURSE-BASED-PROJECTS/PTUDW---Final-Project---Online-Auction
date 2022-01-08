import express, {request} from "express";
import productModel from "../models/product.model.js";
import accountModel from "../models/account.model.js";
import historybidModel from "../models/historybid.model.js";
import moment from "moment";
import fs from "fs";
import multer from "multer";

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
    for(let i = 0; i < list.length; i++){
        listID += list[i].ProID + ' ';
    }
    listID = listID.trim()
    //----

    for (const p of list) {
        p.auth = req.session.auth;
        p.isSold = await productModel.isSold(p.ProID);
        p.isNew = await productModel.isNew(p.ProID, 10);
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
            isVisible: (+page === 1 ) ? false : true,
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
    const relatives = await productModel.findRelatedProducts(ProID,product[0].CatIDNext);
    const seller = await accountModel.findByUsername(product[0].Seller);
    const bidderFlag = await accountModel.findByUsername(product[0].Bidder);
    let isRightSeller = false;
    let isAuth = false;


    if (req.session.auth) {
        isAuth = await productModel.isAuthProduct(ProID, req.session.authAccount.username);

        if (product[0].Bidder === req.session.authAccount.username) {
            product[0].isAuction = false;
        } else {
            product[0].isAuction = true;
        }

        if (product[0].Seller === req.session.authAccount.username)
            isRightSeller = true;

    }

    if (product === null) {
        return res.redirect('/');
    }

    res.render('vwCategory/product', {
        layout: 'SignUp_login',
        product: product[0],
        isAuth,
        isExpired,
        listBid,
        isHasBidder: listBid.length !==0,
        relatedProducts:relatives,
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
    }else if (product[0].isVerify) {
        if (+account.point / +account.sumBid < 0.8){
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
            await productModel.updateSuccessul(username, product[0].PriceWin);
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

                // email here

                await historybidModel.addHistory(historybid, id, product[0].BidderCount);
                await productModel.updateCurrentPrice(id, priceBid)
            } else {
                const priceWinAll = +priceBidFlag === 0 ? product[0].firstPrice : +priceBidFlag + +product[0].stepPrice;

                const historybid = {
                    ProIDHistory: id,
                    BidderHistory: username,
                    PriceBid: priceBid,
                    PriceWinAll: priceWinAll,
                    PriceStart: product[0].PriceCurrent,
                }

                await historybidModel.addHistory(historybid, id, product[0].BidderCount);
                await productModel.updateCurrentPrice(id, priceWinAll)
                await productModel.updateBidderFlag(username, id)
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
        PriceWinAll: product[0].PriceWin,
        isSuccessful: 1
    }

    await historybidModel.addHistoryBuyNow(historybid);
    res.redirect('/info/wonProduct');
});

router.post('/del/:username', async function (req, res) {
    const username = req.params.username;
    const ProID = req.body.id;
    const product = await productModel.findByProID(ProID);
    const historybidDel = await historybidModel.findHistorybidByUsername(username,ProID)

    let isFirst = false;
    if(await historybidModel.checkFirst(username,ProID)){
        isFirst = true;
    }

    await productModel.updateIsAllowed(ProID, username);
    let ListBidderAfterDel = await historybidModel.findListBidderAfterDel(ProID);

    await historybidModel.filterListAfterDel(ListBidderAfterDel,historybidDel.PriceBid,ProID
        ,product[0].stepPrice,isFirst,product[0].firstPrice);
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

    res.redirect('/product/detail/' + ProID);

});


export default router