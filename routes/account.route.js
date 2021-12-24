import express from "express";
import bcrypt from 'bcrypt';
import accountModel from "../models/account.model.js";
import moment from "moment";

const router = express.Router();

router.get('/register', async function (req, res) {
    res.render('vwSignin_Login/Signin', {
        layout: 'Signin_Login'
    });
});

router.post('/register', async function (req, res) {
    const rawPassword = req.body.password;
    const salt = bcrypt.genSaltSync(10);
    const hash = bcrypt.hashSync(rawPassword, salt);
    const dayOfBirth = moment(req.body.dayOfBirth, 'DD/MM/YYYY').format('YYYY-MM-DD');
    const account = {
        name: req.body.name,
        address: req.body.address,
        email: req.body.email,
        dob: dayOfBirth,
        point: 0,
        level: "bidder",
        username: req.body.username,
        password: hash,
    }

    await accountModel.addAccount(account);


    res.render('vwSignin_Login/Signin', {
        layout: 'Signin_Login'
    });
});

router.get('/is-available', async function (req, res) {
    const username = req.query.username;

    const account = await accountModel.findByUsername(username);

    if (account === null) {
        return res.json(true);
    }

    res.json(false);
});

router.get('/is-password', async function (req, res) {
    const username = req.session.authAccount.username;
    const passDb = await accountModel.findPasswordByUsername(username);

    const ret = bcrypt.compareSync(req.query.password, passDb);
    res.json(ret);
});

router.get('/login', async function (req, res) {
    if (req.headers.referer !== "/account/login" && req.headers.referer !== "/favicon.ico") {
        req.session.retUrl = req.headers.referer;
    }
    res.render('vwSignin_Login/Login', {
        layout: 'Signin_Login'
    });
});

router.post('/login', async function (req, res) {
    const account = await accountModel.findByUsername(req.body.username);

    if (account === null) {
        return res.render('vwSignin_Login/Login', {
            layout: 'Signin_Login',
            errMessage: "Tài khoản hoặc mật khẩu sai",
        });
    }
    const ret = bcrypt.compareSync(req.body.password, account.password);
    if (ret === false) {
        return res.render('vwSignin_Login/Login', {
            layout: 'Signin_Login',
            errMessage: "Tài khoản hoặc mật khẩu sai",
        });
    }

    delete account.password;

    req.session.auth = true;
    req.session.authAccount = account;

    const url = req.session.retUrl || '/';
    res.redirect(url);
});

router.post('/logout', async function (req, res) {

    req.session.auth = false;
    req.session.authAccount = null;

    const url = req.headers.referer || '/';

    res.redirect(url);
});
export default router