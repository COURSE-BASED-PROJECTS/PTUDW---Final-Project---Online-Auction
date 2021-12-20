import categoryModel from "../models/category.model.js";

export default function (app) {
    app.use(async function (req, res, next) {
        // if(req.originalUrl !== "/account/login" && req.originalUrl !== "/" && req.originalUrl !== "/favicon.ico")
        //     req.session.retUrl = req.originalUrl;

        if(typeof (req.session.auth) === 'undefined'){
            req.session.auth = false;

        }else if(req.session.auth !== false){
            const account = req.session.authAccount;

            if(account.level === 'bidder')
                res.locals.Bidder = true;
            else if(account.level === 'seller')
                res.locals.Seller = true;
            else if(account.level === 'admin')
                res.locals.Admin = true;
        }

        res.locals.auth = req.session.auth;
        res.locals.authAccount = req.session.authAccount;

        next();
    });

    app.use(async function (req, res, next) {
        res.locals.lcCategories = await categoryModel.findAll();
        next();
    });
}