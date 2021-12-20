import express from "express";
import productModel from "../models/product.model.js";

const router = express.Router();

router.get('/:word',async function (req,res){
    const word = req.params.word;
    const type = req.query.type;
    let type_1 = false,type_2=false,type_3=false,type_4=false;
    let type_price = false,type_time = false

    if(+type === 1){
        type_1 = true;
        type_price = true;
    }
    else if(+type === 2){
        type_2 = true;
        type_price = true;
    }
    else if(+type === 3){
        type_3 = true;
        type_time = true;
    }
    else if(+type === 4){
        type_4 = true;
        type_time = true;
    }

    let product;
    const limit = 6;
    const page = req.query.page || 1;
    const offset = (page-1)*limit;
    if(typeof (type) === 'undefined'){
        product = await productModel.searchProduct(word,limit,offset);
    }else{
        product = await productModel.searchProductByType(word,type,limit,offset);
    }

    const count = product.length;
    let nPages = Math.floor(count/limit);
    if(count%limit >0) nPages++;

    const pageNumbers = [];
    for(let i=1;i<=nPages;i++){
        pageNumbers.push({
            value: i,
            isCurrent: +page === i
        });
    }

    res.render('vwSearch/searchResultPage',{
        layout:'Search',
        product,
        word,
        count,
        type_1,type_2,type_3,type_4,
        type_price, type_time,
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

export default router