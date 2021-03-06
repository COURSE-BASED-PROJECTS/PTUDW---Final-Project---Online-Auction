import db from '../utils/db.js'
import dateFormat from "../utils/dateFormat.js";
import classifyTypeSort from "../utils/classifyTypeSort.js";
import moment from "moment";
import accountModel from "./account.model.js";
import sendMail from "../utils/sendMail.js";


export default {
    async findTopClose(){
        const now = moment().format("YYYY-MM-DD HH:mm");
        const list = await db.select().table('products')
            .orderBy('DateEnd')
            .where('DateEnd', '>', now)
            .andWhere('emailed','0')
            .limit(5);        dateFormat({key:list});

        return list
    },
    async findTopBidder(){
        const now = moment().format("YYYY-MM-DD HH:mm");
        let list = await db.select().table('products')
            .orderBy('BidderCount', 'desc')
            .where('DateEnd', '>', now)
            .andWhere('emailed','0')
            .limit(5);        dateFormat({key:list});

        return list
    },
    async findTopPrice(){
        const now = moment().format("YYYY-MM-DD HH:mm");
        let list = await db.select().table('products')
            .orderBy('PriceCurrent', 'desc')
            .where('DateEnd', '>', now)
            .andWhere('emailed','0')
            .limit(5);
        dateFormat({key:list});

        return list
    },

    async findRelatedProducts(ProID,CatIDNext){
        let list = await db.select()
            .table('products')
            .where('CatIDNext',CatIDNext)
            .andWhereNot('ProID',ProID)
            .orderByRaw('RAND()')
            .limit(5);
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
    async findBySeller(username) {
        let list = await db.select().table('products').where('Seller',username);
        dateFormat({key:list});

        if (list.length === 0)
            return null;

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
    async searchProductBySearching(word){
        const sql = `SELECT *
                     FROM products
                     WHERE MATCH (ProName) AGAINST ('${word}')`

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
    async findProductEnd(){
        const now = moment().format("YYYY-MM-DD HH:mm");
        let list = await db('products').where('DateEnd', '<', now);
        dateFormat({key:list});

        return list
    },

    async delProduct(ProID){
        // del following by step to avoid foreign key error
        await db('favorite').where('ProID',ProID).del();
        await db('historybid').where('ProIDHistory',ProID).del();
        await db('lockauction').where('id',ProID).del();
        await db('products').where('ProID',ProID).del();
    },

    async isSold(ProID){
        const list = await db('historybid').where({ProIDHistory:ProID,isSuccessful:true});

        if(list.length !== 0){
            return true;
        }

        return false;
    },

    async isAuthProduct(ProID, seller){
        const list = await db('products').where({ProID:ProID, Seller:seller});

        if(list.length !== 0){
            return true;
        }
        return false;
    },

    async isNew(ProID,Nminutes){
        const list = await db('products').where({ProID:ProID});
        dateFormat({key:list});

        const dateStart = moment(list[0].DateStart,'DD/MM/YYYY HH:mm').format("YYYY-MM-DD HH:mm");
        const now = moment().format("YYYY-MM-DD HH:mm");

        const duration = moment(now).diff(moment(dateStart));
        const m = moment.duration(duration).asMinutes();

        if(+m <= Nminutes){
            return true;
        }
        return false;

    },
    async updateSuccessul(username,priceWinAll,ProID){
        await db('historybid')
            .where({BidderHistory:username,ProIDHistory:ProID})
            .update({isSuccessful:true,PriceWinAll:priceWinAll});
    },
    async updateBidderFlag(username,ProID, PriceCurrent){
        await db('products')
            .where({ProID:ProID})
            .update({Bidder:username, PriceCurrent:PriceCurrent});
    },
    async updateCurrentPrice(ProID,PriceCurrent){
        await db('products')
            .where({ProID:ProID})
            .update({PriceCurrent:PriceCurrent});
    },
    async incrementBidderCount(ProID,count){
        await db('products')
            .where({ProID:ProID})
            .update({BidderCount:+count+1});
    },
    async updateIsAllowed(ProID,username){
        await db('historybid')
            .where({ProIDHistory:ProID,BidderHistory:username})
            .update({isAllowed:false});
    },
    async updatePriceWinAll(ProID,username,PriceWinAll){
        await db('historybid')
            .where({ProIDHistory:ProID,BidderHistory:username})
            .update({PriceWinAll:PriceWinAll});
    },
    async updateDescription(ProID, Description, Time, newDescription){
        await db('products')
            .where({ProID:ProID})
            .update({Description: Description + "<p>&nbsp;</p>" + Time + "<p>&nbsp;</p>" + newDescription});
    },
    async updateEmailed(ProID){
        await db('products')
            .where({ProID:ProID})
            .update({emailed:1});
    },
    async findByOffset(limit,offset){
        const list = await db('products')
            .limit(limit)
            .offset(offset)
            .select();
        dateFormat({key:list});

        return list;
    },
    async changeBidder(username) {
        const listPro = await db('products').where({Bidder: username});
        dateFormat({key:listPro});
        if (listPro !== null) {
            for (let p of listPro){
                const newBidder = await db('historybid').where({ProIDHistory: p.ProID}).orderBy('PriceBid', 'desc').limit(1);
                if (newBidder.length !== 0){
                    const bidderCount = +p.BidderCount - 1;
                    await db('products').where({ProID: p.ProID}).update({Bidder: newBidder[0].BidderHistory})
                    await db('products').where({ProID: p.ProID}).update({PriceCurrent: newBidder[0].PriceBid});
                    await db('products').where({ProID: p.ProID}).update({BidderCount: bidderCount});
                    const accountSeller = await accountModel.findByUsername(p.Seller);
                    const contentSeller = "S???n ph???m: " + p.ProName
                        + " c???a b???n ????ng v??o l??c: " + p.DateStart + " ???? thay ?????i gi?? do ng?????i gi??? gi?? b??? x??a kh???i h??? th???ng." +
                        " Gi?? hi???n t???i l??: " + p.PriceCurrent
                        + ". Vui l??ng ????ng nh???p h??? th???ng ????? xem chi ti???t."
                    sendMail(accountSeller.email, contentSeller);

                    // email ng?????i ??ang gi??? gi?? sau khi x??a
                    const accountBidder = await accountModel.findByUsername(newBidder[0].BidderHistory);
                    const contentBidder = "Gi?? s???n ph???m: " + p.ProName
                        + " ???????c ????ng v??o l??c: " + p.DateStart + " c???a Seller: " +
                        p.Seller + "hi???n t???i l??: " + p.PriceCurrent
                        + ". B???n l?? ng?????i ??ang gi??? gi?? s???n ph???m n??y, vui l??ng v??o h??? th???ng ????? xem chi ti???t." +
                        "Ch??ng t??i s??? g???i email cho b???n khi gi?? s???n ph???m thay ?????i. C??m ??n b???n ???? tham gia ?????u gi?? tr??n h??? th???ng c???a ch??ng t??i."
                    sendMail(accountBidder.email, contentBidder);
                } else {
                    await db('products').where({Bidder: username}).update({Bidder: null, BidderCount: 0});
                    const accountSeller = await accountModel.findByUsername(p.Seller);
                    const contentSeller = "S???n ph???m: " + p.ProName
                        + " c???a b???n ????ng v??o l??c: " + p.DateStart + " ???? kh??ng c??n ng?????i ?????u gi?? do ng?????i gi??? gi?? duy nh???t b??? x??a kh???i h??? th???ng." +
                        " Gi?? hi???n t???i l??: " + p.PriceCurrent
                        + ". Vui l??ng ????ng nh???p h??? th???ng ????? xem chi ti???t."
                    sendMail(accountSeller.email, contentSeller);
                }
            }
        }
    },

    async isNearlyExpired(ProID){
        const list = await db('products').where({ProID:ProID});
        dateFormat({key:list});

        const dateEnd = moment(list[0].DateEnd,'DD/MM/YYYY HH:mm').format("YYYY-MM-DD HH:mm");
        const now = moment().format("YYYY-MM-DD HH:mm");

        const duration = moment(now).diff(moment(dateEnd));
        const m = moment.duration(duration).asMinutes();

        if(+m <= 5){
            return true;
        }
        return false;
    },
    async addMoreTime(ProID,dateEnd){
        // const dateEndUpdate = moment(dateEnd,'DD/MM/YYYY HH:mm').format("YYYY-MM-DD HH:mm");

        await db('products')
            .where({ProID:ProID})
            .update({DateEnd:moment(dateEnd,'DD/MM/YYYY HH:mm').add(10,'minutes').format("YYYY-MM-DD HH:mm")});
    }
}