import db from '../utils/db.js'
import dateFormat from "../utils/dateFormat.js";

export default {

    async findWonProduct(username){
        let list = await db('historybid')
            .join('products', 'historybid.ProIDHistory', '=', 'products.ProID')
            .where({BidderHistory:username,isWinner:true,isAllowed:true,isSuccessful:true})
            .select();

        dateFormat({key:list});

        return list
    },
    async getPointAccount(username){
        const list = await db('account').where('username',username);
        return list[0].point;
    },

    async findSoldProduct(username){
        let list = await db('historybid')
            .join('products', 'historybid.ProIDHistory', '=', 'products.ProID')
            .where({Seller:username,isAllowed:true,isSuccessful:true})
            .select();

        dateFormat({key:list});

        return list
    },

    async updateCommentSeller(username,ProID,comment){
        await db('historybid')
            .join('products', 'historybid.ProIDHistory', '=', 'products.ProID')
            .where({Seller: username,ProIDHistory:ProID})
            .update({ commentSeller: comment });
    },

    async updateLikeSeller(username,ProID){

        await db('historybid')
            .join('products', 'historybid.ProIDHistory', '=', 'products.ProID')
            .where({ Seller: username,ProIDHistory:ProID})
            .update({ pointFromSeller: 1 });
    },

    async updateDislikeSeller(username,ProID){
        await db('historybid')
            .join('products', 'historybid.ProIDHistory', '=', 'products.ProID')
            .where({ Seller: username,ProIDHistory:ProID})
            .update({ pointFromSeller: -1 });
    },
}