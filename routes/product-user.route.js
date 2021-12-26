import express from "express";
import productModel from "../models/product.model.js";
import accountModel from "../models/account.model.js";
import historybidModel from "../models/historybid.model.js";
import moment from "moment";

const router = express.Router();

router.get('/byCat/:id',async function (req,res){
    const CatIDNext = req.params.id || 0;

    const limit = 6;
    const page = req.query.page || 1;
    const offset = (page-1)*limit;

    const total = await productModel.countByCatIDNext(CatIDNext);
    let nPages = Math.floor(total/limit);
    if(total%limit >0) nPages++;

    const pageNumbers = [];
    for(let i=1;i<=nPages;i++){
        pageNumbers.push({
            value: i,
            isCurrent: +page === i
        });
    }

    const list = await productModel.findPageByCatIDNext(CatIDNext,limit,offset);

    for(const p of list){
        p.auth = req.session.auth;
        p.isSold = await productModel.isSold(p.ProID);
        p.isNew = await productModel.isNew(p.ProID,10);
    }

    let found = false;
    for(const c of  res.locals.lcCategories){
        for(const tmp of c.listsub){
            if(tmp.CatIDNext === +CatIDNext){
                c.isActive = true;
                tmp.isActive = true;
                found = true;
                break;
            }
        }

        if(found)
            break;
    }

    res.render('vwCategory/category',{
        layout:'main',
        list,
        isEmpty: list.length === 0,
        pageNumbers,
        pageNext: {
            page:+page+1,
            isVisible: (+page === 1 && nPages === 1) ? false : (+page === nPages ?false:true),
        },
        pagePrev: {
            page: +page-1,
            isVisible: (+page === 1 && nPages === 1) ? false : true,
        },
    });
});

router.get('/detail/:id',async function (req,res){
    const ProName = req.params.name;
    const ProID = req.params.id;
    const product = await productModel.findByProID(ProID);
    const dateEnd = moment(product[0].DateEnd,'DD/MM/YYYY hh:mm').format("YYYY-MM-DD hh:mm");
    const now = moment().format("YYYY-MM-DD hh:mm");
    const isSold = await productModel.isSold(ProID);
    const isExpired = moment(now).isAfter(dateEnd) || isSold;

    if(product === null){
        return res.redirect('/');
    }

    res.render('vwCategory/product',{
        layout:'SignUp_login',
        product: product[0],
        isExpired,
    });
});

router.get('/infoProduct/:id',async function (req,res){
    const id = req.params.id;
    const product = await productModel.findByProID(id);
    const account = await accountModel.findByUsername(req.session.authAccount.username);

    const dateEnd = moment(product[0].DateEnd,'DD/MM/YYYY hh:mm').format("YYYY-MM-DD hh:mm");
    const now = moment().format("YYYY-MM-DD hh:mm");
    const isSold = await productModel.isSold(id);
    const isExpired = moment(now).isAfter(dateEnd) || isSold;

    product[0].isExpired = isExpired;

    if(!account.isActive){
        res.json(false);
    }else if(product[0].isVerify){
        if(+account.point/+account.sumBid < 0.8)
            res.json("lowPoint")
    }else{
        res.json(product[0]);
    }

});

router.post('/buynow',async function (req,res){
    const id = req.body.id;
    const product = await productModel.findByProID(id);
    const account = await accountModel.findByUsername(req.session.authAccount.username);

    const dateEnd = moment(product[0].DateEnd,'DD/MM/YYYY hh:mm').format("YYYY-MM-DD hh:mm");
    const now = moment().format("YYYY-MM-DD hh:mm");
    const isSold = await productModel.isSold(id);
    const isExpired = moment(now).isAfter(dateEnd) || isSold;
    const priceBid = req.body.number;
    const username = req.session.authAccount.username;

    if(isExpired){
        res.redirect('/product/detail/'+id);
    }else{
        if(+priceBid >= +product[0].PriceWin){
            const historybid = {
                ProIDHistory : id,
                BidderHistory: username,
                PriceBid: priceBid,
                PriceWinAll:product[0].PriceWin,
                PriceStart: product[0].PriceCurrent,
            }

            await historybidModel.addHistory(historybid, id,product[0].BidderCount);
            await productModel.updateBidderFlag(username,id);
            await productModel.updateSuccessul(username,product[0].PriceWin);
        }else{
            const priceBidFlag = await historybidModel.getPriceBid(product[0].Bidder,id);
            if(+priceBid<=+priceBidFlag){
                const historybid = {
                    ProIDHistory : id,
                    BidderHistory: username,
                    PriceBid: priceBid,
                    PriceWinAll:priceBid,
                    PriceStart: priceBid ,
                }

                await historybidModel.addHistory(historybid, id,product[0].BidderCount);
                await productModel.updateCurrentPrice(id,priceBid)
            }else{
                const historybid = {
                    ProIDHistory : id,
                    BidderHistory: username,
                    PriceBid: priceBid,
                    PriceWinAll:+priceBidFlag + +product[0].stepPrice,
                    PriceStart: +priceBidFlag + +product[0].stepPrice,
                }

                await historybidModel.addHistory(historybid, id,product[0].BidderCount);
                await productModel.updateBidderFlag(username,id)
            }
        }


        const url = req.headers.referer || '/';
        res.redirect(url);
    }

});

// router.post('/favorite',async function (req,res){
//     const ProID = req.params.id;
//     const product = await productModel.findByProID(ProID);
//
//     if(product === null){
//         return res.redirect('/');
//     }
//
//     res.render('vwCategory/product',{
//         layout:'SignUp_login',
//         product: product[0],
//     });
// });


export default router