import express from "express";
import productFavoriteModel from "../models/productFavorite.model.js";
import productHistoryModel from "../models/productHistory.model.js";
import productAuctionModel from "../models/productOnAuction.model.js";
import productWonModel from "../models/productWon.model.js";
import accountModel from "../models/account.model.js";


const router = express.Router();


router.get('/reviewHistory',async function (req,res){
    const username = req.session.authAccount.username;
    const list = await productHistoryModel.findHistoryProduct(username);
    const point = await accountModel.getPointAccount(username);

    res.render('vwInfo/reviewHistory',{
        layout:'main',
        isHistory:true,
        list,
        isEmpty: list.length === 0,
        point,
        isPositive: +point >= 0
    });
});

router.get('/updateInfo',async function (req,res){
    res.render('vwInfo/updateInfo',{
        layout:'Signin_login',
        isUpdateInfo:true,
    });
});

router.get('/favouriteProduct',async function (req,res){
    const list = await productFavoriteModel.findFavorite(req.session.authAccount.username)

    res.render('vwInfo/favouriteProduct',{
        layout:'main',
        isFavorite:true,
        list,
        isEmpty: list.length === 0,
    });
});

router.post('/cancelFavorite/:ProID',async function (req,res){
    const username = req.session.authAccount.username;
    const ProID = req.params.ProID;

    await productFavoriteModel.cancelFavorite(ProID,username);

    const url = req.headers.referer || '/';
    res.redirect(url);
});

router.post('/addFavorite/:ProID',async function (req,res){
    const username = req.session.authAccount.username;
    const ProID = req.params.ProID;
    const entity = {
        username:username,
        ProID:ProID
    }
    await productFavoriteModel.addFavorite(entity);

    const url = req.headers.referer || '/';
    res.redirect(url);
});

router.get('/onlineAuction',async function (req,res){
    const username = req.session.authAccount.username;
    const list = await productAuctionModel.findOnAuction(username);

    res.render('vwInfo/auctionProduct',{
        layout:'main',
        isOnlineAuction:true,
        list,
        isEmpty: list.length === 0
    });
});

router.get('/wonProduct',async function (req,res){
    const username = req.session.authAccount.username;
    const list = await productHistoryModel.findHistoryProduct(username);

    res.render('vwInfo/wonProduct',{
        layout:'main',
        isWon:true,
        list,
        isEmpty: list.length === 0,
    });
});

router.post('/wonProduct/:ProID',async function (req,res){
    const username = req.session.authAccount.username;
    const ProID = req.params.ProID;
    await productWonModel.updateCommentBidder(username,ProID,req.body.comment);

    const url = req.headers.referer || '/';
    res.redirect(url);
});

router.post('/wonProduct/like/:ProID',async function (req,res){
    const username = req.session.authAccount.username;
    const ProID = req.params.ProID;
    await productWonModel.updateLike(username,ProID);

    const url = req.headers.referer || '/';
    res.redirect(url);
});

router.post('/wonProduct/dislike/:ProID',async function (req,res){
    const username = req.session.authAccount.username;
    const ProID = req.params.ProID;
    await productWonModel.updateDislike(username,ProID);

    const url = req.headers.referer || '/';
    res.redirect(url);
});

export default router