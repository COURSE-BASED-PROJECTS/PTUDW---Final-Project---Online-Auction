import db from '../utils/db.js'
import productModel from "./product.model.js";
import accountModel from "./account.model.js";
import moment from "moment";
import dateFormat from "../utils/dateFormat.js";

export default {
    async addHistory(entity,id, count) {
        console.log(id)
        const list = await db('historybid')
            .where({ProIDHistory:id,BidderHistory:entity.BidderHistory})
            .select();


        if(list.length === 0){
            await db('historybid').insert(entity);
            await productModel.incrementBidderCount(id,count);
        }else{
            entity.time = new Date();
            entity.isAllowed = true;
            await db('historybid')
                .where({ProIDHistory:id,BidderHistory:entity.BidderHistory})
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
            .orderBy('time','asc')
            .select();

        for(let i=0;i<list.length;i++){
            list[i].time = moment(list[i].time,'YYYY-MM-DD hh:mm:ss').format('DD/MM/YYYY hh:mm');
        }

        return list
    },

    async filterListAfterDel(listAfterDel,PriceDel,ProID,stepPrice,isFirst,firstPrice){
        const result = [];

        if(listAfterDel.length <= 1)
            return

        let max = listAfterDel[0].PriceBid;

        for(let i=0;i<listAfterDel.length;i++){
            if(listAfterDel[i].PriceBid >= PriceDel && listAfterDel[i].PriceBid>=max){
                await db('historybid')
                    .where({ProIDHistory:ProID,BidderHistory:listAfterDel[i].BidderHistory})
                    .update({PriceWinAll:isFirst&& i===0 ? firstPrice:max+stepPrice});
            }
            if(listAfterDel[i].PriceBid>max)
                max = listAfterDel[i].PriceBid;
        }
    },

    async findHistorybidByUsername(username,ProID){
        const historybid = await db('historybid').where({ProIDHistory:ProID,BidderHistory:username}).select();

        return historybid[0];
    },

    async checkFirst(username,ProID){
        const list = await db('historybid')
            .where({ProIDHistory:ProID,isAllowed:true})
            .orderBy('time','asc')
            .select();

        return list[0].BidderHistory === username;
    },

    async findListHistoryBidByUsername(username){
        const list = await db('historybid')
            .join('products', 'historybid.ProIDHistory', '=', 'products.ProID')
            .where({BidderHistory:username, isSuccessful:1})
            .select();

        dateFormat({key:list});

        const result = [];

        for(const p of list){
            const dateEnd = moment(p.DateEnd,'DD/MM/YYYY hh:mm').format("YYYY-MM-DD hh:mm");
            const now = moment().format("YYYY-MM-DD hh:mm");
            if(moment(now).isAfter(dateEnd) || await productModel.isSold(p.ProID)){
                if(+p.pointFromSeller > 0)
                    p.isPositiveFromSeller = true;
                else
                    p.isPositiveFromSeller = false;
                result.push(p);
            }
        }

        return result;
    },

    async findListHistorySeller(username){
        const list = await db('historybid')
            .join('products', function (){
                this.on('historybid.ProIDHistory', '=', 'products.ProID')
                    .andOn('historybid.BidderHistory', '=', 'products.Bidder')
            })
            .where({Seller:username})
            .select();

        dateFormat({key:list});

        const result = [];

        for(const p of list){
            const dateEnd = moment(p.DateEnd,'DD/MM/YYYY hh:mm').format("YYYY-MM-DD hh:mm");
            const now = moment().format("YYYY-MM-DD hh:mm");
            if(moment(now).isAfter(dateEnd) || await productModel.isSold(p.ProID)){
                if(+p.pointFromBidder > 0)
                    p.isPositiveFromBidder = true;
                else
                    p.isPositiveFromBidder = false;
                result.push(p);
            }
        }

        return result;
    },
    async deleteAccount(username){
        await db('historybid')
            .where({BidderHistory: username})
            .delete()
    }

}