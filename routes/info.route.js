import express from "express";
import productFavoriteModel from "../models/productFavorite.model.js";
import productHistoryModel from "../models/productHistory.model.js";
import productAuctionModel from "../models/productOnAuction.model.js";
import productWonModel from "../models/productWon.model.js";
import accountModel from "../models/account.model.js";
import moment from "moment";
import bcrypt from "bcrypt";
import nodemailer from "nodemailer";


const router = express.Router();

router.get('/reviewProfile', async function (req, res) {
    const username = req.session.authAccount.username;
    const user = await accountModel.findByUsername(username);
    res.render('vwInfo/profileAccount', {
        layout: 'Signin_login',
        user
    });
});

router.post('/reviewProfile', async function (req, res) {
    req.body.username = req.session.authAccount.username;
    req.body.dob = moment(req.body.dob, 'DD/MM/YYYY').format('YYYY-MM-DD');
    const account  = accountModel.findByUsername(req.body.username);
    if (account.email !== req.body.email){
        req.body.active = 0;
        req.body.otp = Math.floor(Math.random() * 8999) + 1000;
    }
    await accountModel.updateInfoAccount(req.body);
    res.locals.authAccount.name = req.body.name;

    res.redirect('/info/reviewProfile');
});

router.get('/reviewProfile/changePassword', function (req, res) {
    res.render('vwInfo/changePassword', {
        layout: 'Signin_login',
    });
});
router.post('/reviewProfile/changePassword', async function (req, res) {
    const rawPassword = req.body.newPass;
    const salt = bcrypt.genSaltSync(10);
    const hash = bcrypt.hashSync(rawPassword, salt);

    const username = req.session.authAccount.username;
    const entity = {
        username: username,
        password: hash
    }
    await accountModel.updateInfoAccount(entity);
    res.redirect('/info/reviewProfile');
});

router.get('/reviewProfile/activeEmail', async function (req, res) {
    // gửi email
    const username = req.session.authAccount.username;
    const user = await accountModel.findByUsername(username);

    const transporter = nodemailer.createTransport('smtps://group19ktpm%40gmail.com:13141152099@smtp.gmail.com');
    const mailOptions = {
        from: '"Online Auction System" <foo@blurdybloop.com>', // sender address
        to: user.email, // list of receivers
        subject: 'OTP code ✔', // Subject line
        text: 'OTP', // plaintext body
        html: 'Your OTP code: <b>' + user.otp + '</b>'
    };
    transporter.sendMail(mailOptions, function (error, info) {
        if (error) {
            return console.log(error);
        }
        console.log('Message sent: ' + info.response);
    });
    res.render('vwInfo/activeEmail', {
        layout: 'Signin_login',
    });
});
router.post('/reviewProfile/activeEmail', async function (req, res) {
    const username = req.session.authAccount.username;
    const entity = {
        username: username,
        active: 1
    }
    await accountModel.updateInfoAccount(entity);
    res.redirect('/info/reviewProfile');
});

router.get('/reviewHistory', async function (req, res) {
    const username = req.session.authAccount.username;
    const list = await productHistoryModel.findHistoryProduct(username);
    const point = await accountModel.getPointAccount(username);

    res.render('vwInfo/reviewHistory', {
        layout: 'main',
        isHistory: true,
        list,
        isEmpty: list.length === 0,
        point,
        isPositive: +point >= 0
    });
});

router.get('/updateInfo', async function (req, res) {
    res.render('vwInfo/updateInfo', {
        layout: 'Signin_login',
        isUpdateInfo: true,
    });
});

router.get('/favouriteProduct', async function (req, res) {
    const list = await productFavoriteModel.findFavorite(req.session.authAccount.username)

    res.render('vwInfo/favouriteProduct', {
        layout: 'main',
        isFavorite: true,
        list,
        isEmpty: list.length === 0,
    });
});

router.post('/cancelFavorite/:ProID', async function (req, res) {
    const username = req.session.authAccount.username;
    const ProID = req.params.ProID;

    await productFavoriteModel.cancelFavorite(ProID, username);

    const url = req.headers.referer || '/';
    res.redirect(url);
});

router.post('/addFavorite/:ProID', async function (req, res) {
    const username = req.session.authAccount.username;
    const ProID = req.params.ProID;
    const entity = {
        username: username,
        ProID: ProID
    }
    await productFavoriteModel.addFavorite(entity);

    const url = req.headers.referer || '/';
    res.redirect(url);
});

router.get('/onlineAuction', async function (req, res) {
    const username = req.session.authAccount.username;
    const list = await productAuctionModel.findOnAuction(username);

    res.render('vwInfo/auctionProduct', {
        layout: 'main',
        isOnlineAuction: true,
        list,
        isEmpty: list.length === 0
    });
});

router.get('/wonProduct', async function (req, res) {
    const username = req.session.authAccount.username;
    const list = await productHistoryModel.findHistoryProduct(username);

    res.render('vwInfo/wonProduct', {
        layout: 'main',
        isWon: true,
        list,
        isEmpty: list.length === 0,
    });
});

router.post('/wonProduct/:ProID', async function (req, res) {
    const username = req.session.authAccount.username;
    const ProID = req.params.ProID;
    await productWonModel.updateCommentBidder(username, ProID, req.body.comment);

    const url = req.headers.referer || '/';
    res.redirect(url);
});

router.post('/wonProduct/like/:ProID', async function (req, res) {
    const username = req.session.authAccount.username;
    const ProID = req.params.ProID;
    await productWonModel.updateLike(username, ProID);

    const url = req.headers.referer || '/';
    res.redirect(url);
});

router.post('/wonProduct/dislike/:ProID', async function (req, res) {
    const username = req.session.authAccount.username;
    const ProID = req.params.ProID;
    await productWonModel.updateDislike(username, ProID);

    const url = req.headers.referer || '/';
    res.redirect(url);
});

export default router