import express from "express";
import productModel from "../models/product.model.js";

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
    const ProID = req.params.id;
    const product = await productModel.findByProID(ProID);

    if(product === null){
        return res.redirect('/');
    }

    res.render('vwCategory/product',{
        layout:'Signin_login',
        product: product[0],
    });
});



router.post('/buynow/:id',async function (req,res){
    // const ProID = req.params.id;
    // const product = await productModel.findByProID(ProID);
    //
    // if(product === null){
    //     return res.redirect('/');
    // }
    //
    // res.render('vwCategory/product',{
    //     layout:'Signin_login',
    //     product: product[0],
    // });
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
//         layout:'Signin_login',
//         product: product[0],
//     });
// });


export default router