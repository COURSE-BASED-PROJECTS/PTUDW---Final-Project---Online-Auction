import db from '../utils/db.js'
import productModel from "./product.model.js";
import accountModel from "./account.model.js";
import moment from "moment";

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
    async addHistoryBuyNow(entity) {
        await db('historybid').insert(entity);
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
    async findListBidder(ProID) {
        const list = await db('historybid')
            .where({ProIDHistory:ProID,isAllowed:true}).select();

        for(let i=0;i<list.length;i++){
            list[i].time = moment(list[i].time,'YYYY-MM-DD hh:mm:ss').format('DD/MM/YYYY hh:mm');
            list[i].name = await accountModel.getNameByUsername(list[i].BidderHistory);
            list[i].ProID = ProID;
        }

        return list;
    },
    async findListBidderAfterDel(ProID){
        const list = await db('historybid')
            .where({ProIDHistory:ProID,isAllowed:true})
            .orderBy('PriceBid','desc')
            .orderBy('time','desc')
            .select();

        for(let i=0;i<list.length;i++){
            list[i].time = moment(list[i].time,'YYYY-MM-DD hh:mm:ss').format('DD/MM/YYYY hh:mm');
        }

        return list
    },
}