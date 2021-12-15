import express from 'express'
import morgan from 'morgan'
import { engine } from 'express-handlebars';
import hbs_sections from 'express-handlebars-sections';

const app = express();
const port = 3000;

// use public file
app.use(express.static('public'));

// use morgan
app.use(morgan('dev'))

//set up handlebars
app.engine('.hbs', engine({
    extname:'.hbs',
    helpers: {
        section: hbs_sections(),
    }
}));
app.set('view engine', '.hbs');
app.set('views', './views');

// use urlencoded
app.use(express.urlencoded({
    extended:true
}));


// controller
app.get('/', function (req, res)  {
    res.render('home',{
        layout:'main'
    });
})

app.get('/account', function (req, res)  {
    res.render('vwAccount/account');
})

app.get('/category', function (req, res)  {
    res.render('vwCategory/category');
})

app.get('/product', function (req, res)  {
    res.render('vwCategory/product');
})

// add listen port
app.listen(port, function() {
    console.log(`Example app listening at http://localhost:${port}`)
})