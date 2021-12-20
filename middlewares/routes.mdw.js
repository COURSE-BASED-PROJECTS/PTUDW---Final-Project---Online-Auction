import accountRoute from "../routes/account.route.js";

export default function (app){
    // controller
    app.get('/', function (req, res)  {
        res.render('home',{
            layout:'main'
        });
    });

    // route
    app.use('/account',accountRoute);

}
