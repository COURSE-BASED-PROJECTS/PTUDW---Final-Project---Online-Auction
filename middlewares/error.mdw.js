// handle error page

export default function (app){
    app.get('/err', function (req,res){
        throw new Error('Error!')
    });

    app.use(function ( req, res, next) {
        res.render('404',{
            layout: 'error',
        });
    });

    app.use(function (err, req, res, next) {
        console.error(err.stack);
        res.render('500',{
            layout: 'error',
        });
    });
}
