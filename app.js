import express from 'express'
import morgan from 'morgan'

import viewMdw from "./middlewares/view.mdw.js"
import routesMdw from "./middlewares/routes.mdw.js"

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


// add listen port
app.listen(port, function() {
    console.log(`Example app listening at http://localhost:${port}`)
})