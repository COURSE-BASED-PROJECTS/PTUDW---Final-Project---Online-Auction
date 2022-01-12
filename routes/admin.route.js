import express from "express"
import numeral from "numeral";
import bcrypt from "bcrypt";

import accountModel from "../models/account.model.js";
import upgradeModel from "../models/upgrade.model.js";
import categoryModel from "../models/category.model.js";
import productModel from "../models/product.model.js";
import productFavoriteModel from "../models/productFavorite.model.js";
import historybidModel from "../models/historybid.model.js";
import lockAuctionModel from "../models/lockAuction.model.js"
import sendMail from "../utils/sendMail.js";

const router = express.Router();

router.get('/updateCategory', async function (req, res) {
    const listCategory = await categoryModel.findCategory();
    const listCategoryNext = await categoryModel.findCategoryNext();
    const listProduct = await productModel.findByOffset(6,0);

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
    let listSeller = [];
    let listBidder = [];
    let listLockAccount = [];


    for (const account of list) {
        account.info = {
            isPositive: account.point >= 0,
        }
        if(+account.sumBid === 0){
            account.point_percent = 0;
        } else if(account.sumBid>0){
            if(account.point === 0)
                account.point_percent = account.sumBid*-100;
            else
                account.point_percent = (account.point)*100/account.sumBid;
        }

        if (account.isLock !== 1){
            if (account.level === 'seller'){
                if(listSeller.length < 6)
                    listSeller.push(account);
            }
            if (account.level === 'bidder'){
                if(listBidder.length < 6)
                    listBidder.push(account);
            }
        } else {
            if(listLockAccount.length < 6)
                listLockAccount.push(account);
        }
    }

    res.render('vwAccount/infoAccount', {
        layout: 'main',
        isSeller: true,
        isAdmin: true,
        isAccount: true,
        isEmpty: list.length === 0,
        listSeller,
        listBidder,
        listLockAccount
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

router.post('/Account/resetPassword', async function (req, res) {
    const list = await accountModel.findAll();
    let content = '';
    for (let acc of list){
        let rawPassword = acc.username;
        let salt = bcrypt.genSaltSync(10);
        let hash = bcrypt.hashSync(rawPassword, salt);
        await accountModel.updateInfoAccount({username: acc.username, password: hash});

        content = 'Tài khoản ' + acc.username + ' của bạn đã được hệ thống đặt lại mật khẩu. ' +
            'Mật khẩu được đặt lại trùng với tên đăng nhập của bạn. Vui lòng kiểm tra lại và đổi mật khẩu mới';
        sendMail(acc.email, content);
    }

    const url = req.headers.referer || '/';
    res.redirect(url);
});

router.post('/Account/degrade/:username', async function (req, res) {
    const username = req.params.username;
    await accountModel.degradeAccount(username);

    const user = await accountModel.findByUsername(username);
    const content = 'Tài khoản #' + user.username + ' của bạn đã bị hạ cấp thành Bidder. Vui lòng liên hệ với chúng tôi để biết thêm chi tiết. ' +
        'Cám ơn bạn đã sử dụng hệ thống của chúng tôi.';
    sendMail(user.email, content);

    const url = req.headers.referer || '/';
    res.redirect(url);
});

router.post('/Account/lock/:username', async function (req, res) {
    const username = req.params.username;
    await accountModel.lockAccount(username);

    const user = await accountModel.findByUsername(username);
    const content = 'Tài khoản #' + user.username + ' của bạn đã bị khóa. Bạn sẽ không thể đăng nhập vào hệ thống. ' +
        'Vui lòng liên hệ lại chúng tôi đễ biết thêm chi tiết';
    sendMail(user.email, content);

    const url = req.headers.referer || '/';
    res.redirect(url);
});

router.post('/Account/delete/:username', async function (req, res) {
    const username = req.params.username;
    const user = await accountModel.findByUsername(username);
    await upgradeModel.deleteAccount(username);
    await productFavoriteModel.deleteAccount(username);
    await historybidModel.deleteAccount(username);
    await lockAuctionModel.deleteAccount(username);
    await  productModel.changeBidder(username);
    const listPro = await productModel.findBySeller(username);
    if (listPro !== null){
        for (let p of listPro){
            await productModel.delProduct(p.ProID);
        }
    }
    const content = 'Tài khoản #' + user.username + ' của bạn đã bị xóa khỏi hệ thống. Bạn sẽ không thể đăng nhập vào hệ thống. ' +
        'Vui lòng liên hệ lại chúng tôi đễ biết thêm chi tiết';
    sendMail(user.email, content);
    await accountModel.deleteAccount(username);



    const url = req.headers.referer || '/';
    res.redirect(url);
});

router.post('/Account/unlock/:username', async function (req, res) {
    const username = req.params.username;
    await accountModel.unlockAccount(username);

    const user = await accountModel.findByUsername(username);
    const content = 'Tài khoản #' + user.username + ' của bạn đã được mở khóa. Bạn đã có thể đăng nhập vào hệ thống. ' +
        'Cám ơn bạn đã sử dụng hệ thống của chúng tôi.';
    sendMail(user.email, content);

    const url = req.headers.referer || '/';
    res.redirect(url);
});

router.post('/Account/upgrade/:username', async function (req, res) {
    const username = req.params.username;
    await accountModel.upgradeAccount(username);

    const user = await accountModel.findByUsername(username);
    const content = 'Tài khoản #' + user.username + ' của bạn đã được xét duyệt nâng cấp thành Seller. ' +
        'Bạn đã được quyền đăng tải sản phẩm. Vui lòng đăng nhập lại để cập nhật chức năng. ' +
        'Cám ơn bạn đã sử dụng hệ thống của chúng tôi.';
    sendMail(user.email, content);

    const url = req.headers.referer || '/';
    res.redirect(url);
});

router.post('/Account/cancel/:username', async function (req, res) {
    const username = req.params.username;
    await accountModel.cancelUpgradeAccount(username);

    const user = await accountModel.findByUsername(username);
    const content = 'Tài khoản #' + user.username + ' của bạn đã bị từ chối nâng cấp thành Seller. ' +
        'Vui lòng liên hệ lại chúng tôi đễ biết thêm chi tiết';
    sendMail(user.email, content);
    const url = req.headers.referer || '/';
    res.redirect(url);
});

router.post('/delProduct/:ProID', async function (req, res) {
    const ProID = req.params.ProID;
    await productModel.delProduct(ProID);

    const product = await productModel.findByProID(ProID);
    const accountSeller = await accountModel.findByUsername(product[0].Seller);
    const content = "Sản phẩm: " + product[0].ProName
        + " của bạn đăng vào lúc: " + product[0].DateStart + " đã bị xóa khỏi hệ thống vì lí do nào đó. " +
        "Vui lòng liên hệ với chúng tôi để biết thêm thông tin chi tiết."
        + " Cám ơn bạn đã đăng sản phẩm trên hệ thống của chúng tôi."
    sendMail(accountSeller.email, content);

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

router.get('/loadmore', async function (req, res) {
    const offset = req.query.offset;
    const list = await productModel.findByOffset(6,(offset)*6);

    for (const product of list) {
        product.NameCatIDNext = await categoryModel.findByCatIDNext(product.CatIDNext);
        product.PriceCurrent = await numeral(product.PriceCurrent).format('0,0');
    }
    res.json(list);
});

router.get('/loadmoreSeller', async function (req, res) {
    const offset = req.query.offset;
    const list = await accountModel.findAllSeller(offset*6);

    for(const account  of list){
        if(+account.sumBid === 0){
            account.point_percent = 0;
        } else if(account.sumBid>0){
            if(account.point === 0)
                account.point_percent = account.sumBid*-100;
            else
                account.point_percent = (account.point)*100/account.sumBid;
        }
    }

    res.json(list);
});

router.get('/loadmoreBidder', async function (req, res) {
    const offset = req.query.offset;
    const list = await accountModel.findAllSeller(offset*6);

    for(const account  of list){
        if(+account.sumBid === 0){
            account.point_percent = 0;
        } else if(account.sumBid>0){
            if(account.point === 0)
                account.point_percent = account.sumBid*-100;
            else
                account.point_percent = (account.point)*100/account.sumBid;
        }
    }

    res.json(list);
});


export default router