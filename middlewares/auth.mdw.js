export function auth(req, res, next) {
    if (req.session.auth === false) {
        req.session.retUrl = req.originalUrl;
        return res.redirect('/account/login')
    }

    next();
}

export function authSeller(req, res, next) {
    if (req.session.auth === false) {
        req.session.retUrl = req.originalUrl;
        return res.redirect('/account/login')
    } else if (req.session.authAccount.level === 'bidder') {
        if (!res.locals.oldSeller) {
            const url = '/';
            return res.redirect(url);
        }
    }
    next();
}

export function authAdmin(req, res, next) {
    if (req.session.auth === false) {
        req.session.retUrl = req.originalUrl;
        return res.redirect('/account/login')
    } else if (req.session.authAccount.level === 'bidder' || req.session.authAccount.level === 'seller') {
        const url = '/';
        return res.redirect(url);
    }

    next();
}

export function activeEmail(req, res, next) {
    if (req.session.authAccount.isActive === 1) {
        return res.redirect('/info/reviewProfile')
    }
    next();
}