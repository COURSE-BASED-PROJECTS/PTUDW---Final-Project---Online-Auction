import db from '../utils/db.js'
import dateFormat from "../utils/dateFormat.js";
import moment from "moment";
import productModel from "./product.model.js";
import accountModel from "./account.model.js";

export default {

    async findHistoryProduct(username){
        const list = await db('historybid')
            .join('products', 'historybid.ProIDHistory', '=', 'products.ProID')
            .where({BidderHistory:username,Bidder:username})
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

    async findSoldProduct(username){
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
                // if(+p.pointFromSeller > 0)
                //     p.isPositiveFromBidder = true;
                // else
                //     p.isPositiveFromBidder = false;
                result.push(p);
            }
        }


        return result;
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
            .update({ pointFromSeller: 1,isCancel:true });

        let bidder = await db('products')
            .where({ProID:ProID,Seller:username})
            .select('Bidder');

        bidder = bidder[0].Bidder;
        const point = await accountModel.getPointAccount(bidder);

        await db('account')
            .where({ username: bidder})
            .update({ point: +point + 1 });
    },

    async updateDislikeSeller(username,ProID){
        await db('historybid')
            .join('products', 'historybid.ProIDHistory', '=', 'products.ProID')
            .where({ Seller: username,ProIDHistory:ProID})
            .update({ pointFromSeller: -1 ,isCancel:true});

        let bidder = await db('products')
            .where({ProID:ProID,Seller:username})
            .select('Bidder');

        bidder = bidder[0].Bidder;
        const point = await accountModel.getPointAccount(bidder);

        await db('account')
            .where({ username: bidder})
            .update({ point: +point + -1 });
    },

    async cancelSold(username,ProID){
        await db('historybid')
            .join('products', function (){
                this.on('historybid.ProIDHistory', '=', 'products.ProID')
                    .andOn('historybid.BidderHistory', '=', 'products.Bidder')
            })
            .where({Seller:username})
            .update({pointFromSeller: -1,commentSeller:"Người thắng không thanh toán",isCancel:true});


        let bidder = await db('products')
                                .where({ProID:ProID,Seller:username})
                                .select('Bidder');

        bidder = bidder[0].Bidder;
        const point = await accountModel.getPointAccount(bidder);

        await db('account')
            .where({ username: bidder})
            .update({ point: +point + -1 });
    },
}