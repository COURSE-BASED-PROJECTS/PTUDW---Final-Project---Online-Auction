import express from 'express'
import morgan from 'morgan'

import localMdw from "./middlewares/locals.mdw.js"
import viewMdw from "./middlewares/view.mdw.js"
import routesMdw from "./middlewares/routes.mdw.js"
import sessionMdw from "./middlewares/session.mdw.js";
import errorMdw from "./middlewares/error.mdw.js"

const app = express();
const port = 3000;

// use public file
app.use(express.static('public'));

// use morgan
app.use(morgan('dev'))

// use urlencoded
app.use(express.urlencoded({
    extended:true
}));

viewMdw(app);
routesMdw(app);
sessionMdw(app);
localMdw(app);
errorMdw(app);

// add listen port
app.listen(port, function() {
    console.log(`Example app listening at http://localhost:${port}`)
})