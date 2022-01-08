import express from "express"
import accountModel from "../models/account.model.js";
import upgradeModel from "../models/upgrade.model.js";
import categoryModel from "../models/category.model.js";
import productModel from "../models/product.model.js"

const router = express.Router();

router.get('/updateCategory', async function (req, res) {
    const listCategory = await categoryModel.findCategory();
    const listCategoryNext = await categoryModel.findCategoryNext();
    const listProduct = await productModel.findAll();

    for (const product of listProduct) {
        product.NameCatIDNext = await categoryModel.findByCatIDNext(product.CatIDNext);
    }

    res.render('vwCategory/updateCategory', {
        layout: 'main',
        isSeller: true,
        isAdmin: true,
        isUpdateCategory: true,
        listCategory,
        listCategoryNext,
        listProduct
    });
});

router.get('/updateCategory/addMain',async function (req, res) {
    const listCategory = await categoryModel.findCategory();
    const CatID = +listCategory[listCategory.length - 1].CatID + 1;
    res.render('vwCategory/addMainCategory', {
        layout: 'main',
        CatID
    });
});

router.post('/updateCategory/addMain',async function (req, res) {
    await categoryModel.addCategory(req.body);
    res.redirect('/admin/updateCategory')
});

router.get('/updateCategory/addSub', async function (req, res) {
    const listCategory = await categoryModel.findCategory();
    res.render('vwCategory/addSubCategory', {
        layout: 'main',
        listCategory
    });
});
router.post('/updateCategory/addSub', async function (req, res) {
    req.body.CatID = +req.body.CatID;
    req.body.CatIDNext = await categoryModel.findCategoryNextID();
    await categoryModel.addSubCategory(req.body);
    res.redirect('/admin/updateCategory');
});

router.get('/updateCategory/patchMainCat/:CatID', async function (req, res) {
    const CatID = req.params.CatID;
    const listCategory = await categoryModel.findCategory();
    const CatName = listCategory[CatID-1].CatName;
    res.render('vwCategory/patchMainCategory', {
        layout: 'main',
        CatID,
        CatName
    });
});
router.post('/updateCategory/patchMainCat/:CatID', async function (req, res) {
    await categoryModel.patchMainCategory(req.body);
    res.redirect('/admin/updateCategory');
});


router.get('/updateCategory/patchSubCat/:CatIDNext', async function (req, res) {
    const CatIDNext = req.params.CatIDNext;
    const CatID = await categoryModel.findCatIDByCatIDNext(CatIDNext);
    const listCategory = await categoryModel.findCategory();
    for (let list of listCategory){
        if (list.CatID === CatID){
            list.selected = true;
        }
    }
    const CatNextName = await categoryModel.findByCatIDNext(CatIDNext);
    res.render('vwCategory/patchSubCategory', {
        layout: 'main',
        listCategory,
        CatNextName
    });
});
router.post('/updateCategory/patchSubCat/:CatIDNext', async function (req, res) {
    req.body.CatID = +req.body.CatID;
    req.body.CatIDNext = req.params.CatIDNext;
    await categoryModel.patchSubCategory(req.body);
    res.redirect('/admin/updateCategory');
});

router.get('/Account', async function (req, res) {
    const list = await accountModel.findAll();

    for (const account of list) {
        account.info = {
            isPositive: account.point >= 0,
            isSeller: account.level === 'seller',
            isBidder: account.level === 'bidder',
            isLock: account.isLock === 1
        }
    }
    res.render('vwAccount/infoAccount', {
        layout: 'main',
        isSeller: true,
        isAdmin: true,
        isAccount: true,
        isEmpty: list.length === 0,
        list,
    });
});

router.get('/verifySeller', async function (req, res) {
    const listUpgradeAcc = await upgradeModel.findAmountUpgradeAccount();
    const limit = 6;
    const page = req.query.page || 1;
    const offset = (page - 1) * limit;

    const total = listUpgradeAcc.length;
    let nPages = Math.floor(total / limit);
    if (total % limit > 0) nPages++;

    const pageNumbers = [];
    for (let i = 1; i <= nPages; i++) {
        pageNumbers.push({
            value: i,
            isCurrent: +page === i
        });
    }

    const list = await accountModel.findUpgradeAccount(limit, offset);
    for (const account of list) {
        account.info = {
            isPositive: account.point >= 0,
            isSeller: account.level === 'seller'
        }
    }
    res.render('vwAccount/upgradeAccount', {
        layout: 'main',
        //isSeller: true,
        //isAdmin: true,
        isVerifySeller: true,
        list,
        isEmpty: list.length === 0,
        pageNumbers,
        pageNext: {
            page: +page + 1,
            isVisible: (+page === 1 && nPages === 1) ? false : (+page === nPages ? false : true),
        },
        pagePrev: {
            page: +page - 1,
            isVisible: (+page === 1) ? false : true,
        }
    });
});

router.post('/Account/degrade/:username', async function (req, res) {
    const username = req.params.username;
    await accountModel.degradeAccount(username);

    const url = req.headers.referer || '/';
    res.redirect(url);
});

router.post('/Account/lock/:username', async function (req, res) {
    const username = req.params.username;
    await accountModel.lockAccount(username);

    const url = req.headers.referer || '/';
    res.redirect(url);
});

router.post('/Account/unlock/:username', async function (req, res) {
    const username = req.params.username;
    await accountModel.unlockAccount(username);

    const url = req.headers.referer || '/';
    res.redirect(url);
});

router.post('/Account/upgrade/:username', async function (req, res) {
    const username = req.params.username;
    await accountModel.upgradeAccount(username);

    const url = req.headers.referer || '/';
    res.redirect(url);
});

router.post('/Account/cancel/:username', async function (req, res) {
    const username = req.params.username;
    await accountModel.cancelUpgradeAccount(username);

    const url = req.headers.referer || '/';
    res.redirect(url);
});

router.post('/delProduct/:ProID', async function (req, res) {
    const ProID = req.params.ProID;
    await productModel.delProduct(ProID);

    const url = req.headers.referer || '/';
    res.redirect(url);
});

router.post('/delCatNext/:CatIDNext', async function (req, res) {
    const CatIDNext = req.params.CatIDNext;
    await categoryModel.delCatIDNext(CatIDNext);

    const url = req.headers.referer || '/';
    res.redirect(url);
});

router.post('/delCat/:CatID', async function (req, res) {
    const CatID = req.params.CatID;
    await categoryModel.delCatID(CatID);

    const url = req.headers.referer || '/';
    res.redirect(url);
});

export default router