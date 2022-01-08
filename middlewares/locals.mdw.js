import categoryModel from "../models/category.model.js";
import moment from "moment";
import upgradeModel from "../models/upgrade.model.js";
export default function (app) {
    app.use(async function (req, res, next) {
        // if(req.originalUrl !== "/account/login" && req.originalUrl !== "/" && req.originalUrl !== "/favicon.ico")
        //     req.session.retUrl = req.originalUrl;

        if (typeof (req.session.auth) === 'undefined') {
            req.session.auth = false;

        } else if (req.session.auth !== false) {
            const account = req.session.authAccount;

            if (account.level === 'bidder')
                res.locals.Bidder = true;
            else if (account.level === 'seller') {
                const info = await upgradeModel.findUsername(account.username);
                if (info !== null){
                    const now = moment().format("YYYY-MM-DD hh:mm:ss");
                    const startDate = moment(info.dateStart).format("YYYY-MM-DD hh:mm:ss");

                    const date1 = new Date(startDate);
                    const date2 = new Date(now);
                    const Difference_In_Days = (date2.getTime() - date1.getTime()) / (1000 * 3600 * 24);

                    if (Difference_In_Days > 7){
                        res.locals.expired = true;
                    } else {
                        res.locals.expired = false;
                    }
                }
                res.locals.expired = false;
                res.locals.Seller = true;
            } else if (account.level === 'admin')
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