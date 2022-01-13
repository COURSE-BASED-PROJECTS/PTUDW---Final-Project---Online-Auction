import express from 'express'
import morgan from 'morgan'
import async_errors from 'express-async-errors';


import localMdw from "./middlewares/locals.mdw.js"
import viewMdw from "./middlewares/view.mdw.js"
import routesMdw from "./middlewares/routes.mdw.js"
import sessionMdw from "./middlewares/session.mdw.js"
import errorMdw from "./middlewares/error.mdw.js"

const app = express();
const port = process.env.PORT || 3000;

// use public file
app.use(express.static('public'));

// use morgan
app.use(morgan('dev'))

// use urlencoded
app.use(express.urlencoded({
    extended:true
}));

sessionMdw(app);
localMdw(app);
viewMdw(app);
routesMdw(app);
errorMdw(app);


// add listen port
app.listen(port, function() {
    console.log(`Online auction app listening at http://localhost:${port}`);
})