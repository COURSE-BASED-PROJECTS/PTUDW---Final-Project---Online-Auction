// controller
import productModel from "../models/product.model.js";
import productUserRoute from "../routes/product-user.route.js";
import accountRoute from "../routes/account.route.js";
import infoRoute from "../routes/info.route.js";
import sellerRoute from "../routes/seller.route.js";
import searchRoute from "../routes/search.route.js";
import adminRoute from "../routes/admin.route.js";
import {authSeller,authAdmin,auth} from "./auth.mdw.js";

export default function (app){
    app.get('/', async function (req, res)  {
        const topClose = await productModel.findTopClose();
        const topBidder = await productModel.findTopBidder();
        const topPrice = await productModel.findTopPrice();
        let listID = '';
        for(let i = 0; i < topClose.length; i++){
            listID += topClose[i].ProID + ' ';
        }
        for(let i = 0; i < topBidder.length; i++){
            listID += topBidder[i].ProID + ' ';
        }
        for(let i = 0; i < topPrice.length; i++){
            listID += topPrice[i].ProID + ' ';
        }
        listID = listID.trim()
        // console.log(req.session.auth);
        // console.log(req.session.authAccount);

        res.render('home',{
            layout:'main',
            topProductClose: topClose,
            topBidderCount: topBidder,
            topProductPrice: topPrice,
            listID
        });
    });

// route
    app.use('/account',accountRoute);
    app.use('/product',productUserRoute);
    app.use('/info',auth,infoRoute);
    app.use('/seller',authSeller,sellerRoute);
    app.use('/admin',authAdmin,adminRoute);
    app.use('/search',searchRoute);
}
