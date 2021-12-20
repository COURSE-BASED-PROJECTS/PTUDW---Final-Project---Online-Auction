import express from "express";

const router = express.Router();

router.get('/register',async function (req,res){
    res.render('vwSignin_Login/Signin',{
        layout:'Signin_Login'
    });
});

export default router