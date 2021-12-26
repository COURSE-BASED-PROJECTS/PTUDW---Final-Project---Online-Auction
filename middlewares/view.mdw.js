import {engine} from "express-handlebars";
import hbs_sections from "express-handlebars-sections";
import numeral from 'numeral';
import moment from "moment";

export default function (app){

//set up handlebars
    app.engine('.hbs', engine({
        extname:'.hbs',
        helpers: {
            format_number(val){
                return numeral(val).format('0,0');
            },
            format_date(date){
                return moment(date,'YYYY-MM-DD').format('DD/MM/YYYY');
            },
            mask_name(name){
                let masking = "";
                let replace = "*";
                for(let i = 0; i < name.lastIndexOf(' '); i++){
                    if (name[i] === ' ') continue;
                    masking = masking + replace;
                }
                return masking + name.substring(name.lastIndexOf(' ') + 1, name.length);
            },
            section: hbs_sections(),
        }
    }));
    app.set('view engine', '.hbs');
    app.set('views', './views');
}