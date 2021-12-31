import express from "express"
import moment from 'moment'
import multer from 'multer'
import productModel from "../models/product.model.js";
import productOnAuctionModel from "../models/productOnAuction.model.js";
import productHistoryModel from "../models/productHistory.model.js";
import fs from 'fs';
import categoryModel from "../models/category.model.js";

const router = express.Router();

router.get('/upload',async function (req,res){
    const listCategoryNext = await categoryModel.findCategoryNext();
    res.render('vwSeller/sellProduct',{
        layout:'SignUp_Login',
        isUpload: true,
        listCategoryNext
    });
});

// const upload = multer({ dest: 'uploads/' });

router.post('/upload',async function (req,res){
    let count = await productModel.countProduct();
    count = count[0].count + 1;
    const dir = './public/img/product/'+count;

    if (!fs.existsSync(dir)){
        fs.mkdirSync(dir, { recursive: true });
    }

    const des = count;
    let iterator = 1;

    const storage = multer.diskStorage({
        destination: function (req, file, cb) {
            cb(null, './public/img/product/'+des);
        },
        filename: function (req, file, cb) {
            cb(null, iterator++ +'.png');
        }
    });

    const upload = multer({ storage: storage })
    upload.array('image',7)(req, res, function(err){
        console.log(req.body)
        const DateEnd = moment(req.body.DateEnd,'DD/MM/YYYY hh:mm').format('YYYY-MM-DD hh:mm:ss');

        if(err){
            console.log(err);
        }else {
            const product = {
                ProID: +count,
                ProName: req.body.name,
                PriceCurrent: req.body.FirstPrice,
                PriceWin: req.body.Price,
                stepPrice: req.body.stepPrice,
                DateEnd: DateEnd,
                Description: req.body.FullDesc,
                CatIDNext:req.body.catIdNext,
                isVerify:req.body.Point === 'on',
                renewal: req.body.checkbox === 'on',
            }

            productModel.addProduct(product)

            res.render('vwSeller/sellProduct',{
                layout:'SignUp_Login',
            });
        }
    });

});

router.get('/liveProduct', async function (req, res)  {
    const username = req.session.authAccount.username;
    const list = await productOnAuctionModel.findOnAuctionSeller(username);

    res.render('vwSeller/liveProduct',{
        layout:'main',
        isSeller: true,
        isLive:true,
        list,
        isEmpty:list.length===0,
    });
})

router.get('/soldProduct', async function (req, res)  {
    const username = req.session.authAccount.username;
    const list = await productHistoryModel.findSoldProduct(username);

    res.render('vwSeller/soldProduct',{
        layout:'main',
        isSeller: true,
        isSold:true,
        list,
        isEmpty: list.length === 0
    });
})

router.post('/soldProduct/:ProID',async function (req,res){
    const username = req.session.authAccount.username;
    const ProID = req.params.ProID;

    await productHistoryModel.updateCommentSeller(username,ProID,req.body.comment);
    const url = req.headers.referer || '/';
    res.redirect(url);
});


router.post('/soldProduct/like/:ProID',async function (req,res){
    const username = req.session.authAccount.username;
    const ProID = req.params.ProID;
    await productHistoryModel.updateLikeSeller(username,ProID);

    const url = req.headers.referer || '/';
    res.redirect(url);
});

router.post('/soldProduct/dislike/:ProID',async function (req,res){
    const username = req.session.authAccount.username;
    const ProID = req.params.ProID;
    await productHistoryModel.updateDislikeSeller(username,ProID);

    const url = req.headers.referer || '/';
    res.redirect(url);
});

router.post('/cancelSoldProduct/:ProID',async function (req,res){
    const username = req.session.authAccount.username;
    const ProID = req.params.ProID;

    await productHistoryModel.cancelSold(username,ProID);

    const url = req.headers.referer || '/';
    res.redirect(url);
});

export default router