
export function auth (req,res,next){
    if(req.session.auth === false){
        req.session.retUrl = req.originalUrl;
        return res.redirect('/account/login')
    }

    next();
}

export function authSeller (req,res,next){
    if(req.session.auth === false){
        req.session.retUrl = req.originalUrl;
        return res.redirect('/account/login')
    }else if(req.session.authAccount.level === 'bidder'){
        const url = '/';
        return res.redirect(url);
    }

    next();
}

export function authAdmin(req,res,next){
    if(req.session.auth === false){
        req.session.retUrl = req.originalUrl;
        return res.redirect('/account/login')
    }else if(req.session.authAccount.level === 'bidder' || req.session.authAccount.level === 'seller'){
        const url = '/';
        return res.redirect(url);
    }

    next();
}