import express from "express"
import accountModel from "../models/account.model.js";
import categoryModel from "../models/category.model.js";
import productModel from "../models/product.model.js"

const router = express.Router();

router.get('/updateCategory',async function (req,res){
    const listCategory = await categoryModel.findCategory();
    const listCategoryNext = await categoryModel.findCategoryNext();
    const listProduct = await productModel.findAll();

    for(const product of listProduct){
        product.NameCatIDNext = await categoryModel.findByCatIDNext(product.CatIDNext);
    }

    res.render('vwCategory/updateCategory',{
        layout:'main',
        isSeller: true,
        isAdmin: true,
        isUpdateCategory:true,
        listCategory,
        listCategoryNext,
        listProduct
    });
});

router.get('/Account', async function (req, res)  {
    const list = await accountModel.findAll();

    for(const account of list){
        account.info = {
            isPositive:account.point >=0,
            isSeller: account.level === 'seller'
        }
    }

    res.render('vwAccount/infoAccount',{
        layout:'main',
        isSeller: true,
        isAdmin: true,
        isAccount:true,
        isEmpty:list.length === 0,
        list,
    });
});

router.get('/verifySeller', async function (req, res)  {
    const list = await accountModel.findUpgradeAccount();

    for(const account of list){
        account.info = {
            isPositive:account.point >=0,
        }
    }

    res.render('vwAccount/upgradeAccount',{
        layout:'main',
        isSeller: true,
        isAdmin: true,
        isVerifySeller:true,
        list,
        isEmpty: list.length===0,
    });
});

router.post('/Account/degrade/:username', async function (req, res)  {
    const username = req.params.username;
    await accountModel.degradeAccount(username);

    const url = req.headers.referer || '/';
    res.redirect(url);
});

router.post('/Account/upgrade/:username', async function (req, res)  {
    const username = req.params.username;
    await accountModel.upgradeAccount(username);

    const url = req.headers.referer || '/';
    res.redirect(url);
});

router.post('/Account/cancel/:username', async function (req, res)  {
    const username = req.params.username;
    await accountModel.cancelUpgradeAccount(username);

    const url = req.headers.referer || '/';
    res.redirect(url);
});

router.post('/delProduct/:ProID', async function (req, res)  {
    const ProID = req.params.ProID;
    await productModel.delProduct(ProID);

    const url = req.headers.referer || '/';
    res.redirect(url);
});

router.post('/delCatNext/:CatIDNext', async function (req, res)  {
    const CatIDNext = req.params.CatIDNext;
    await categoryModel.delCatIDNext(CatIDNext);

    const url = req.headers.referer || '/';
    res.redirect(url);
});

router.post('/delCat/:CatID', async function (req, res)  {
    const CatID = req.params.CatID;
    await categoryModel.delCatID(CatID);

    const url = req.headers.referer || '/';
    res.redirect(url);
});

export default router