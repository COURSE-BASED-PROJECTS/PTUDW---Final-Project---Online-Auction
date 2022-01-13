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
            const dateEnd = moment(p.DateEnd,'DD/MM/YYYY HH:mm').format("YYYY-MM-DD HH:mm");
            const now = moment().format("YYYY-MM-DD HH:mm");
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
    async findPageHistory(username, limit, offset) {
        const list = await db('historybid')
            .join('products', 'historybid.ProIDHistory', '=', 'products.ProID')
            .where({BidderHistory:username,Bidder:username})
            .select();

        dateFormat({key:list});

        const result = [];
        const final = [];

        for(const p of list){
            const dateEnd = moment(p.DateEnd,'DD/MM/YYYY HH:mm').format("YYYY-MM-DD HH:mm");
            const now = moment().format("YYYY-MM-DD HH:mm");
            if(moment(now).isAfter(dateEnd) || await productModel.isSold(p.ProID)){
                if(+p.pointFromSeller > 0)
                    p.isPositiveFromSeller = true;
                else
                    p.isPositiveFromSeller = false;
                result.push(p);
            }
        }

        for(let i=offset;(i<(limit+offset)) && i<result.length;i++){
            final.push(result[i]);
        }

        return final;

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
            const dateEnd = moment(p.DateEnd,'DD/MM/YYYY HH:mm').format("YYYY-MM-DD HH:mm");
            const now = moment().format("YYYY-MM-DD HH:mm");
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
    async countPageSoldProduct(username){
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
            const dateEnd = moment(p.DateEnd,'DD/MM/YYYY HH:mm').format("YYYY-MM-DD HH:mm");
            const now = moment().format("YYYY-MM-DD HH:mm");
            if(moment(now).isAfter(dateEnd) || await productModel.isSold(p.ProID)){
                result.push(p);
            }
        }

        return result.length;
    },
    async findPageSoldProduct(username,limit,offset){
        const list = await db('historybid')
            .join('products', function (){
                this.on('historybid.ProIDHistory', '=', 'products.ProID')
                    .andOn('historybid.BidderHistory', '=', 'products.Bidder')
            })
            .where({Seller:username})
            .select();

        dateFormat({key:list});

        const result = [];
        const final = [];

        for(const p of list){
            const dateEnd = moment(p.DateEnd,'DD/MM/YYYY HH:mm').format("YYYY-MM-DD HH:mm");
            const now = moment().format("YYYY-MM-DD HH:mm");
            if(moment(now).isAfter(dateEnd) || await productModel.isSold(p.ProID)){
                result.push(p);
            }
        }

        for(let i=offset;(i<(limit+offset)) && i<result.length;i++){
            final.push(result[i]);
        }

        return final;

    },

    async updateCommentSeller(username,ProID,comment){
        let bidder = await db('products')
            .where({ProID:ProID,Seller:username})
            .select('Bidder');
        bidder = bidder[0].Bidder;

        await db('historybid')
            .join('products', 'historybid.ProIDHistory', '=', 'products.ProID')
            .where({Seller: username,ProIDHistory:ProID,BidderHistory: bidder})
            .update({ commentSeller: comment,isCancel:true});
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
        const sumBid = await accountModel.getSumBidAccount(bidder)

        await db('account')
            .where({ username: bidder})
            .update({ point: +point + 1 ,sumBid : +sumBid+1});
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
        const sumBid = await accountModel.getSumBidAccount(bidder)

        await db('account')
            .where({ username: bidder})
            .update({sumBid : +sumBid+1});
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
        const sumBid = await accountModel.getSumBidAccount(bidder)

        await db('account')
            .where({ username: bidder})
            .update({sumBid : +sumBid+1});
    },
    async findWonProduct(username) {
        const list = await db('historybid')
            .join('products', 'historybid.ProIDHistory', '=', 'products.ProID')
            .where({BidderHistory:username})
            .select();

        dateFormat({key:list});

        const result = [];

        for(const p of list){
            const dateEnd = moment(p.DateEnd,'DD/MM/YYYY HH:mm').format("YYYY-MM-DD HH:mm");
            const now = moment().format("YYYY-MM-DD HH:mm");
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
    async findPageWonProduct(username, limit, offset) {
        const list = await db('historybid')
            .join('products', 'historybid.ProIDHistory', '=', 'products.ProID')
            .where({BidderHistory:username})
            .select();

        dateFormat({key:list});

        const result = [];
        const final = [];

        for(const p of list){
            const dateEnd = moment(p.DateEnd,'DD/MM/YYYY HH:mm').format("YYYY-MM-DD HH:mm");
            const now = moment().format("YYYY-MM-DD HH:mm");
            if(moment(now).isAfter(dateEnd) || await productModel.isSold(p.ProID)){
                if(+p.pointFromSeller > 0)
                    p.isPositiveFromSeller = true;
                else
                    p.isPositiveFromSeller = false;
                result.push(p);
            }
        }

        for(let i=offset;(i<(limit+offset)) && i<result.length;i++){
            final.push(result[i]);
        }

        return final;
    }
}