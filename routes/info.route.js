import express from "express";
import productFavoriteModel from "../models/productFavorite.model.js";
import productHistoryModel from "../models/productHistory.model.js";
import productAuctionModel from "../models/productOnAuction.model.js";
import productWonModel from "../models/productWon.model.js";
import accountModel from "../models/account.model.js";
import upgradeModel from "../models/upgrade.model.js";
import moment from "moment";
import bcrypt from "bcrypt";
import sendMail from "../utils/sendMail.js";
import generateOtp from "../utils/generateOTP.js";
import {activeEmail} from "../middlewares/auth.mdw.js";


const router = express.Router();

router.get('/reviewProfile', async function (req, res) {
    const username = req.session.authAccount.username;
    const account = await accountModel.findByUsername(username);
    const user = await accountModel.findByUsername(username);
    let isBidder = 0;
    if (user.level === 'bidder'){
        isBidder = 1;
    }
    let isSeller = 0;
    if (user.level === 'seller'){
        isSeller = 1;
    }
    let isPending = 1;
    const info = await upgradeModel.findUsername(user.username);
    if (info === null || info.isCheck === 1){
        isPending = 0;
    };

    let point_percent = 0;
    if(+account.sumBid === 0){
        point_percent = 0;
    } else if(account.sumBid>0){
        if(account.point === 0)
            point_percent = account.sumBid*-100;
        else
            point_percent = (account.point)*100/account.sumBid;
    }

    res.render('vwInfo/profileAccount', {
        layout: 'SignUp_Login',
        user,
        isProfile: true,
        isBidder,
        isPending,
        isSeller,
        point_percent
    });
});

router.post('/reviewProfile', async function (req, res) {
    req.body.username = req.session.authAccount.username;
    req.body.dob = moment(req.body.dob, 'DD/MM/YYYY').format('YYYY-MM-DD');
    const account  = await accountModel.findByUsername(req.body.username);
    if (account.email !== req.body.email){
        req.body.isActive = 0;
        req.body.otp = generateOtp(4);
    }
    res.locals.authAccount.name = req.body.name;

    await accountModel.updateInfoAccount(req.body);
    res.redirect('/info/reviewProfile');
});

router.get('/reviewProfile/changePassword', function (req, res) {
    res.render('vwInfo/changePassword', {
        layout: 'SignUp_Login',
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

    const user = await accountModel.findByUsername(username);
    const content = 'Tài khoản ' + user.username + ' của bạn đã đổi mật khẩu thành công. ' +
        'Cám ơn bạn đã sử dụng hệ thống của chúng tôi.';
    sendMail(user.email, content);

    res.redirect('/info/reviewProfile');
});

router.get('/reviewProfile/activeEmail', activeEmail, async function (req, res) {
    const username = req.session.authAccount.username;
    const user = await accountModel.findByUsername(username);
    const content = 'Your OTP code: <b>' + user.otp + '</b>';
    sendMail(user.email, content);

    let resendOtp = false;
    if (req.query.resendOtp === 'true'){
        resendOtp = true;
    }
    res.render('vwInfo/activeEmail', {
        layout: 'SignUp_Login',
        resendOtp
    });
});

router.post('/reviewProfile/activeEmail', async function (req, res) {
    const username = req.session.authAccount.username;
    const entity = {
        username: username,
        isActive: 1
    }
    await accountModel.updateInfoAccount(entity);
    const user = await accountModel.findByUsername(username);
    const content = 'Tài khoản ' + user.username + ' của bạn kích hoạt thành công. Chúng tôi sẽ sử dụng email này của bạn để liên hệ với bạn.' +
        'Cám ơn bạn đã sử dụng hệ thống của chúng tôi.';
    sendMail(user.email, content);
    res.redirect('/info/reviewProfile');
});

router.post('/reviewProfile/activeEmail/resendOtp', async function (req, res) {
    const username = req.session.authAccount.username;
    const otp = generateOtp(4);
    await accountModel.updateInfoAccount({
        username: username,
        otp: otp
    });
    const user = await accountModel.findByUsername(username);

    const content = 'Your OTP code: <b>' + user.otp + '</b>';
    sendMail(user.email, content);

    res.redirect('/info/reviewProfile/activeEmail?resendOtp=true');
});

router.post('/reviewProfile/upgrade', async function (req, res) {
    const username = req.session.authAccount.username;
    const info = await upgradeModel.findUsername(username);
    if (info === null){
        const entity = {
            id: username,
            isCheck: 0
        }
        await upgradeModel.addBidder(entity);
    } else {
        const entity = {
            id: username,
            isCheck: 0,
            isCancel: 0
        }
        await upgradeModel.patch(entity)
    }
    const user = await accountModel.findByUsername(username);
    const content = 'Tài khoản ' + user.username + ' của bạn đã xin xét duyệt trở thành Seller thành công. ' +
        'Vui lòng chờ kết quả xét duyệt của admin. ' +
        'Cám ơn bạn đã sử dụng hệ thống của chúng tôi.';
    sendMail(user.email, content);
    res.redirect('/info/reviewProfile');
});

router.post('/reviewProfile/reUpgrade', async function (req, res) {
    const username = req.session.authAccount.username;
    const entity = {
        id: username,
        isCheck: 0,
        isCancel: 0
    }
    await upgradeModel.patch(entity);
    const user = await accountModel.findByUsername(username);
    const content = 'Tài khoản ' + user.username + ' của bạn đã xin gia hạn Seller thành công. ' +
        'Vui lòng chờ kết quả xét duyệt của admin. ' +
        'Cám ơn bạn đã sử dụng hệ thống của chúng tôi.';
    sendMail(user.email, content);
    res.redirect('/info/reviewProfile');
});

router.get('/reviewHistory', async function (req, res) {
    const username = req.session.authAccount.username;
    const account = await accountModel.findByUsername(username);
    const product = await productHistoryModel.findHistoryProduct(username);
    const point = await accountModel.getPointAccount(username);

    const limit = 6;
    const page = req.query.page || 1;
    const offset = (page - 1) * limit;

    const total = product.length;
    let nPages = Math.floor(total / limit);
    if (total % limit > 0) nPages++;

    const pageNumbers = [];
    for (let i = 1; i <= nPages; i++) {
        pageNumbers.push({
            value: i,
            isCurrent: +page === i
        });
    }

    const list = await productHistoryModel.findPageHistory(username, limit, offset);

    let point_percent = 0;
    if(+account.sumBid === 0){
        point_percent = 0;
    } else if(account.sumBid>0){
        if(account.point === 0)
            point_percent = account.sumBid*-100;
        else
            point_percent = (account.point)*100/account.sumBid;
    }

    res.render('vwInfo/reviewHistory', {
        layout: 'main',
        isHistory: true,
        list,
        isEmpty: list.length === 0,
        point,
        isPositive: +point >= 0,
        pageNumbers,
        pageNext: {
            page: +page + 1,
            isVisible: (+page === 1 && nPages === 1) ? false : (+page === nPages ? false : true),
        },
        pagePrev: {
            page: +page - 1,
            isVisible: (+page === 1) ? false : true,
        },
        point_percent
    });
});

router.get('/updateInfo', async function (req, res) {
    res.render('vwInfo/updateInfo', {
        layout: 'SignUp_Login',
        isUpdateInfo: true,
    });
});

router.get('/favouriteProduct', async function (req, res) {
    const product = await productFavoriteModel.findFavorite(req.session.authAccount.username)
    const limit = 6;
    const page = req.query.page || 1;
    const offset = (page - 1) * limit;

    const total = product.length;
    let nPages = Math.floor(total / limit);
    if (total % limit > 0) nPages++;

    const pageNumbers = [];
    for (let i = 1; i <= nPages; i++) {
        pageNumbers.push({
            value: i,
            isCurrent: +page === i
        });
    }

    const list = await productFavoriteModel.findPageFavorite(req.session.authAccount.username, limit, offset);

    let listID = '';
    for (let i = 0; i < list.length; i++) {
        listID += list[i].ProID + ' ';
    }
    listID = listID.trim()

    res.render('vwInfo/favouriteProduct', {
        layout: 'main',
        isFavorite: true,
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
        }
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
    const product = await productAuctionModel.findOnAuction(username);

    const limit = 6;
    const page = req.query.page || 1;
    const offset = (page - 1) * limit;

    const total = product.length;
    let nPages = Math.floor(total / limit);
    if (total % limit > 0) nPages++;

    const pageNumbers = [];
    for (let i = 1; i <= nPages; i++) {
        pageNumbers.push({
            value: i,
            isCurrent: +page === i
        });
    }

    const list = await productAuctionModel.findPageOnAuction(username, limit, offset);

    let listID = '';
    for (let i = 0; i < list.length; i++) {
        listID += list[i].ProID + ' ';
    }
    listID = listID.trim();
    
    res.render('vwInfo/auctionProduct', {
        layout: 'main',
        isOnlineAuction: true,
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
        }
    });
});

router.get('/wonProduct', async function (req, res) {
    const username = req.session.authAccount.username;
    const product = await productHistoryModel.findWonProduct(username);
    const limit = 6;
    const page = req.query.page || 1;
    const offset = (page - 1) * limit;

    const total = product.length;
    let nPages = Math.floor(total / limit);
    if (total % limit > 0) nPages++;

    const pageNumbers = [];
    for (let i = 1; i <= nPages; i++) {
        pageNumbers.push({
            value: i,
            isCurrent: +page === i
        });
    }

    const list = await productHistoryModel.findPageWonProduct(username, limit, offset);
    for(const p of list){
        p.isComment = false;
        p.isCommentBidder = false;

        if(p.commentSeller && p.pointFromSeller){
            p.isComment = true;
        }
        if(p.commentBidder && p.pointFromBidder){
            p.isCommentBidder = true;
        }

    }
    res.render('vwInfo/wonProduct', {
        layout: 'main',
        isWon: true,
        list,
        isEmpty: list.length === 0,
        pageNumbers,
        pageNext: {
            page: +page + 1,
            isVisible: (+page === 1 && nPages === 1) ? false : (+page === nPages ? false : true),
        },
        pagePrev: {
            page: +page - 1,
            isVisible: (+page === 1) ? false : true,
        }
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