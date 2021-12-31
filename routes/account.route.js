import express from "express";
import bcrypt from 'bcrypt';
import accountModel from "../models/account.model.js";
import moment from "moment";
import sendMail from "../utils/sendMail.js";
import generateOtp from "../utils/generateOTP.js";
import sliceURL from "../utils/sliceURL.js";

const router = express.Router();

router.get('/register', async function (req, res) {
    const url = sliceURL(req.headers.referer);
    if(url !== '/account/register/' && url !=='/account/login'){
        req.session.retUrl = req.headers.referer;
    }else{
        req.session.retUrl = '/';
    }
    res.render('vwSignUp_Login/SignUp', {
        layout: 'SignUp_Login'
    });
});

router.post('/register', async function (req, res) {
    if (req.body['g-recaptcha-response'] === undefined || req.body['g-recaptcha-response'] === '' || req.body['g-recaptcha-response'] === null) {
        return res.render('vwSignUp_Login/SignUp', {
            layout: 'SignUp_Login',
            reCapcha: "chưa xác thực"
        });
    }
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
        isActive: 0,
        otp: generateOtp(4)
    }

    await accountModel.addAccount(account);

    res.redirect('/account/login');
});

router.get('/is-available', async function (req, res) {
    const username = req.query.username;
    const accountHasUsername = await accountModel.findByUsername(username);
    const email = req.query.email;
    if (email === undefined) {
        if (accountHasUsername === null) {
            return res.json(false);
        }
        return res.json(true);
    }
    const accountHasEmail = await accountModel.findByEmail(email);

    if (accountHasUsername === null && accountHasEmail === null) {
        return res.json(true);
    }

    const check = {username: true, email: true};
    if (accountHasUsername !== null) {
        check.username = false;
    }
    if (accountHasEmail !== null) {
        check.email = false;
    }

    return res.json(check);
});
router.get('/is-exist', async function (req, res) {
    const username = req.session.authAccount.username;
    const email = req.query.email;
    const accountHasEmail = await accountModel.findByEmail(email);

    if (accountHasEmail === null || accountHasEmail.username === username) {
        return res.json(true);
    }
    return res.json(false);
});

router.get('/hasAccountLock', async function (req, res) {
    const list = await accountModel.findAll();
    for (const account of list) {
        if (account.isLock === 1) {
            return res.json(true);
        }
    }
    return res.json(false);
});

router.get('/is-password', async function (req, res) {
    const username = req.session.authAccount.username;
    const account = await accountModel.findByUsername(username);

    const ret = bcrypt.compareSync(req.query.password, account.password);
    if (ret === true) {
        return res.json(true);
    }
    return res.json(false);
});

router.get('/is-otp', async function (req, res) {
    const username = req.session.authAccount.username;
    const account = await accountModel.findByUsername(username);
    if (+req.query.otp === account.otp) {
        return res.json(true);
    }
    return res.json(false);
});

router.get('/login', async function (req, res) {
    const prevURL = sliceURL(req.headers.referer);

    if (prevURL !== "/account/login/" && req.headers.referer !== "/favicon.ico"
        && prevURL !== "/account/register/") {
        req.session.retUrl = req.headers.referer;
    }
    res.render('vwSignUp_Login/Login', {
        layout: 'SignUp_Login'
    });
});

router.post('/login', async function (req, res) {
    const account = await accountModel.findByUsername(req.body.username);

    if (account === null) {
        return res.render('vwSignUp_Login/Login', {
            layout: 'SignUp_Login',
            errMessage: "Tài khoản hoặc mật khẩu sai",
        });
    }
    const ret = bcrypt.compareSync(req.body.password, account.password);
    if (ret === false) {
        return res.render('vwSignUp_Login/Login', {
            layout: 'SignUp_Login',
            errMessage: "Tài khoản hoặc mật khẩu sai",
        });
    }

    delete account.password;

    req.session.auth = true;
    req.session.authAccount = account;

    //console.log(req.session.retUrl);
    let url = req.session.retUrl || '/';

    res.redirect(url);
});

router.get('/login/forgotPassword', function (req, res) {
    res.render('vwSignUp_Login/ForgotPassword', {
        layout: 'SignUp_Login'
    });
});

router.post('/login/forgotPassword', async function (req, res) {
    const username = req.query.username;
    const newPass = generateOtp(6) + '';
    console.log(typeof newPass);
    console.log(newPass);
    const salt = bcrypt.genSaltSync(10);
    const hash = bcrypt.hashSync(newPass, salt);
    const entity = {
        username: username,
        password: hash
    }
    await accountModel.updateInfoAccount(entity);

    const account = await accountModel.findByUsername(username);

    const content = 'Your new password is: <b>' + newPass + '</b>.<br/>Please change your password after successful login. If you do not change your password soon, we cannot guarantee your security.'
    sendMail(account.email, content);

    res.redirect('/account/login');
});

router.post('/logout', async function (req, res) {

    req.session.auth = false;
    req.session.authAccount = null;

    const url = req.headers.referer || '/';

    res.redirect(url);
});
export default router