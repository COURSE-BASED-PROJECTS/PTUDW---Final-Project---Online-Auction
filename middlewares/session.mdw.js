import session from 'express-session'
import fn_MySQLStore from 'express-mysql-session';
import {connectionInfo} from "../utils/db.js";

export default function (app){
    const MySQLStore = fn_MySQLStore(session);
    const sessionStore = new MySQLStore(connectionInfo);

    app.set('trust proxy', 1) // trust first proxy
    app.use(session({
        secret: 'hahahaha',
        resave: false,
        saveUninitialized: true,
        store: sessionStore,
        cookie: {
            // secure: true
        }
    }))
}