import db from '../utils/db.js'
import dateFormat from "../utils/dateFormat.js";

export default {

    async findOnAuction(username){
        let list = await db('historybid')
            .join('products', 'historybid.ProIDHistory', '=', 'products.ProID')
            .where({BidderHistory:username,isWinner:false,isAllowed:true,isSuccessful:false})
            .select();

        dateFormat({key:list});

        return list
    },

    async findOnAuctionSeller(username){
        let list = await db('historybid')
            .join('products', 'historybid.ProIDHistory', '=', 'products.ProID')
            .where({Seller:username,isWinner:false,isSuccessful:false})
            .select();

        dateFormat({key:list});

        return list
    },

}