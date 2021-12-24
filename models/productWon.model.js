import db from '../utils/db.js'
import dateFormat from "../utils/dateFormat.js";
import moment from "moment";
import productModel from "./product.model.js";

export default {

    async updateCommentBidder(username,ProID,comment){
        await db('historybid')
            .where({ BidderHistory: username,ProIDHistory:ProID})
            .update({ commentBidder: comment })

    },

    async updateLike(username,ProID){
        await db('historybid')
            .where({ BidderHistory: username,ProIDHistory:ProID})
            .update({ pointFromBidder: 1 })

    },

    async updateDislike(username,ProID){
        await db('historybid')
            .where({ BidderHistory: username,ProIDHistory:ProID})
            .update({ pointFromBidder: -1 })
    }
}