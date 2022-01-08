import db from '../utils/db.js'
import accountModel from "./account.model.js";

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

        let seller = await db('products')
            .where({ProID:ProID,Bidder:username})
            .select('Seller');

        seller = seller[0].Seller;
        const point = await accountModel.getPointAccount(seller);
        const sumbid = await accountModel.getSumBidAccount(seller)

        await db('account')
            .where({ username: seller})
            .update({ point: +point + 1 ,sumbid:+sumbid+1});
    },

    async updateDislike(username,ProID){
        await db('historybid')
            .where({ BidderHistory: username,ProIDHistory:ProID})
            .update({ pointFromBidder: -1 });

        let seller = await db('products')
            .where({ProID:ProID,Bidder:username})
            .select('Seller');

        seller = seller[0].Seller;
        const sumbid = await accountModel.getSumBidAccount(seller)

        await db('account')
            .where({ username: seller})
            .update({sumbid:+sumbid+1});
    }
}