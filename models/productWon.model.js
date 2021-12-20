import db from '../utils/db.js'
import dateFormat from "../utils/dateFormat.js";

export default {

    async findWonProduct(username){
        let list = await db('historybid')
            .join('products', 'historybid.ProIDHistory', '=', 'products.ProID')
            .where({BidderHistory:username,isWinner:false,isAllowed:true,isSuccessful:true})
            .select();

        dateFormat({key:list});

        return list
    },

    async updateCommentBidder(username,ProID,comment){
        await db('historybid')
            .where({ BidderHistory: username,ProID:ProID})
            .update({ commentBidder: comment })

    },

    async updateLike(username,ProID){
        await db('historybid')
            .where({ BidderHistory: username,ProID:ProID})
            .update({ pointFromBidder: 1 })

    },

    async updateDislike(username,ProID){
        await db('historybid')
            .where({ BidderHistory: username,ProID:ProID})
            .update({ pointFromBidder: -1 })

    }
}