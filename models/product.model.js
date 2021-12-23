import db from '../utils/db.js'
import dateFormat from "../utils/dateFormat.js";
import classifyTypeSort from "../utils/classifyTypeSort.js";
import moment from "moment";


export default {
    async findTopClose(){
        const list = await db.select().table('products').orderBy('DateEnd').limit(5);
        dateFormat({key:list});

        return list
    },
    async findTopBidder(){
        let list = await db.select().table('products').orderBy('BidderCount', 'desc').limit(5);
        dateFormat({key:list});

        return list
    },
    async findTopPrice(){
        let list = await db.select().table('products').orderBy('PriceCurrent', 'desc').limit(5);
        dateFormat({key:list});

        return list
    },

    async findByCatIDNext(CatIDNext){
        let list = await db.select().table('products').where('CatIDNext',CatIDNext);
        dateFormat({key:list});

        return list
    },
    async countByCatIDNext(CatIDNext){
        const list = await db('products').where('CatIDNext',CatIDNext).count({amount:'ProID'});
        return list[0].amount;
    },
    async findPageByCatIDNext(CatIDNext,limit,offset){
        let list = await db.select().table('products')
            .where('CatIDNext',CatIDNext)
            .limit(limit)
            .offset(offset);

        dateFormat({key:list});

        return list
    },
    async findByProID(ProID){
        let list = await db.select().table('products').where('ProID',ProID);
        dateFormat({key:list});

        return list
    },

    async countProduct(){
        const count = await db('products').count('ProID',{as: 'count'});
        return count;
    },

    async addProduct(entity){
        return db('products').insert(entity);
    },

    async searchProduct(word,limit,offset){
        const sql = `SELECT *
                     FROM products
                     WHERE MATCH (ProName) AGAINST ('${word}')
                     LIMIT ${limit}
                     OFFSET ${offset}`

        const list = await db.raw(sql);
        dateFormat({key:list[0]});

        return list[0];
    },

    async searchProductByType(word,t,limit,offset){
        const type = classifyTypeSort(t);

        const sql = `SELECT *
                     FROM products
                     WHERE MATCH (ProName) AGAINST ('${word}')
                     ORDER BY ${type}
                     LIMIT ${limit}
                     OFFSET ${offset}`

        const list = await db.raw(sql);
        dateFormat({key:list[0]});

        return list[0];
    },

    async findAll(){
        const list = await db('products').select();
        dateFormat({key:list});

        return list;
    },

    async delProduct(ProID){
        // del following by step to avoid foreign key error
        await db('favorite').where('ProID',ProID).del();
        await db('historybid').where('ProIDHistory',ProID).del();
        await db('products').where('ProID',ProID).del();
    },

    async isSold(ProID){
        const list = await db('historybid').where({ProIDHistory:ProID,isSuccessful:true});

        if(list.length !== 0){
            return true;
        }

        return false;
    },

    async isNew(ProID,Nminutes){
        const list = await db('products').where({ProID:ProID});
        dateFormat({key:list});

        const dateStart = moment(list[0].DateStart,'DD/MM/YYYY hh:mm').format("YYYY-MM-DD hh:mm");
        const now = moment().format("YYYY-MM-DD hh:mm");

        const duration = moment(now).diff(moment(dateStart));
        const m = moment.duration(duration).asMinutes();

        if(+m <= Nminutes){
            return true;
        }
        return false;

    }
}