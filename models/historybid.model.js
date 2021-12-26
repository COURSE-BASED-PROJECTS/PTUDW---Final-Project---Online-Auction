import db from '../utils/db.js'
import productModel from "./product.model.js";

export default {
    async addHistory(entity,id, count) {
        const list = await db('historybid')
            .where({ProIDHistory:entity.ProIDHistory,BidderHistory:entity.BidderHistory})
            .select();
        if(list.length === 0){
            await db('historybid').insert(entity);
            await productModel.incrementBidderCount(id,count);
        }else{
            await db('historybid')
                .where({ProIDHistory:entity.ProIDHistory,BidderHistory:entity.BidderHistory})
                .update(entity);
        }


    },
    async getPriceBid(Bidder,ProID) {
        const result = await db('historybid')
            .where({BidderHistory:Bidder,ProIDHistory:ProID}).select('PriceBid');

        if(result.length === 0){
            return 0;
        }else{
            const priceBid = result[0].PriceBid;
            return priceBid;
        }
    },
}