import categoryModel from "../models/category.model.js";
import moment from "moment";
import upgradeModel from "../models/upgrade.model.js";
import productModel from "../models/product.model.js";
import accountModel from "../models/account.model.js";
import sendMail from "../utils/sendMail.js";

export default function (app) {
    app.use(async function (req, res, next) {
        // if(req.originalUrl !== "/account/login" && req.originalUrl !== "/" && req.originalUrl !== "/favicon.ico")
        //     req.session.retUrl = req.originalUrl;

        if (typeof (req.session.auth) === 'undefined') {
            req.session.auth = false;

        } else if (req.session.auth !== false) {
            const account = req.session.authAccount;

            if (account.level === 'bidder') {
                const info = await upgradeModel.findUsername(account.username);
                if (info !== null) {
                    // Nếu là seller cũ nhưng chưa đăng bán thì khi hạ cấp xem như bidder không giữ lại chức năng
                    if (await productModel.findBySeller(account.username) === null) {
                        res.locals.oldSeller = false;
                    } else {
                        res.locals.oldSeller = true;
                    }
                } else {
                    res.locals.oldSeller = false;
                }
                res.locals.Bidder = true;
            } else if (account.level === 'seller') {
                const info = await upgradeModel.findUsername(account.username);
                if (info !== null) {
                    const now = moment().format("YYYY-MM-DD hh:mm:ss");
                    const startDate = moment(info.dateStart).format("YYYY-MM-DD hh:mm:ss");

                    const date1 = new Date(startDate);
                    const date2 = new Date(now);
                    const Difference_In_Days = (date2.getTime() - date1.getTime()) / (1000 * 3600 * 24);
                    //const Difference_In_Days = 7.5;
                    if (Difference_In_Days > 7) {
                        res.locals.expired = true;
                    } else {
                        res.locals.expired = false;
                    }
                } else {
                    res.locals.expired = false;
                }
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
    // tìm sản phẩm kết thúc để gửi mail mỗi 1 phút
    setInterval(async function () {

            const listProduct = await productModel.findProductEnd();
            for (let lp of listProduct) {
                if (lp.emailed === 0) {
                    if (lp.BidderCount === 0) {
                        const accountSeller = await accountModel.findByUsername(lp.Seller);
                        const content = "Sản phẩm bạn đăng đã hết phiên đấu giá. Rất tiếc không có người mua cho sản phẩm: " + lp.ProName
                            + " của bạn đăng vào lúc: " + lp.DateStart + ". Cám ơn bạn đã đăng sản phẩm trên hệ thống của chúng tôi."
                        sendMail(accountSeller.email, content);
                        await productModel.updateEmailed(lp.ProID);
                    } else {
                        const accountSeller = await accountModel.findByUsername(lp.Seller);
                        const contentSeller = "Sản phẩm bạn đăng đã hết phiên đấu giá. Sản phẩm: " + lp.ProName
                            + " của bạn đăng vào lúc: " + lp.DateStart + " đã có người mua. Vui lòng liên hệ với Bidder " +
                            lp.Bidder + " để giao dịch sản phẩm."
                            + " Cám ơn bạn đã đăng sản phẩm trên hệ thống của chúng tôi."
                        sendMail(accountSeller.email, contentSeller);
                        if (lp.Bidder !== null) {
                            const accountBidder = await accountModel.findByUsername(lp.Bidder);
                            const contentBidder = "Bạn đã thắng sản phẩm: " + lp.ProName
                                + " được đăng vào lúc: " + lp.DateStart + " của Seller: " +
                                lp.Seller + ". Vui lòng liên hệ với Seller để giao dịch sản phẩm. Cám ơn bạn đã giao dịch sản phẩm trên hệ thống của chúng tôi."
                            sendMail(accountBidder.email, contentBidder);
                        }
                        await productModel.updateEmailed(lp.ProID);
                    }
                }
            }
        },
        60000
    );
}