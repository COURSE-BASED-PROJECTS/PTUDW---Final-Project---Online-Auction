import db from '../utils/db.js'
import dateFormat from "../utils/dateFormat.js";
import moment from "moment";
import productModel from "./product.model.js";

export default {

    async findOnAuction(username){
        const list = await db('historybid')
            .join('products', 'historybid.ProIDHistory', '=', 'products.ProID')
            .where({BidderHistory:username,Bidder:username})
            .select();

        dateFormat({key:list});

        const result = [];

        for(const p of list){
            const dateEnd = moment(p.DateEnd,'DD/MM/YYYY HH:mm').format("YYYY-MM-DD HH:mm");
            const now = moment().format("YYYY-MM-DD HH:mm");
            if(!(moment(now).isAfter(dateEnd) || await productModel.isSold(p.ProID))){
                result.push(p);
            }
        }


        return result;
    },

    async findOnAuctionSeller(username){
        const list = await db('products')
            .where({Seller:username})
            .select();

        dateFormat({key:list});
        const result = [];

        for(const p of list){
            const dateEnd = moment(p.DateEnd,'DD/MM/YYYY HH:mm').format("YYYY-MM-DD HH:mm");
            const now = moment().format("YYYY-MM-DD HH:mm");

            if(!(moment(now).isAfter(dateEnd) || await productModel.isSold(p.ProID))){
                result.push(p);
            }
        }

        return result;
    },
    async findPageOnAuctionSeller(username,limit,offset){
        const list = await db('products')
            .where({Seller:username})
            .select();

        dateFormat({key:list});
        const result = [];
        const final = [];

        for(const p of list){
            const dateEnd = moment(p.DateEnd,'DD/MM/YYYY HH:mm').format("YYYY-MM-DD HH:mm");
            const now = moment().format("YYYY-MM-DD HH:mm");

            if(!(moment(now).isAfter(dateEnd) || await productModel.isSold(p.ProID))){
                result.push(p);
            }
        }

        for(let i=offset;(i<(limit+offset)) && i<result.length;i++){
            final.push(result[i]);
        }

        return final;
    },
    async countTotalPages(username){
        const list = await db('products')
            .where({Seller:username})
            .select();

        dateFormat({key:list});
        const result = [];

        for(const p of list){
            const dateEnd = moment(p.DateEnd,'DD/MM/YYYY HH:mm').format("YYYY-MM-DD HH:mm");
            const now = moment().format("YYYY-MM-DD HH:mm");

            if(!(moment(now).isAfter(dateEnd) || await productModel.isSold(p.ProID))){
                result.push(p);
            }
        }

        return result.length;
    },

    async findPageOnAuction(username, limit, offset) {
        const list = await db('historybid')
            .join('products', 'historybid.ProIDHistory', '=', 'products.ProID')
            .where({BidderHistory:username,Bidder:username})
            .limit(limit)
            .offset(offset)
            .select();

        dateFormat({key:list});

        const result = [];

        for(const p of list){
            const dateEnd = moment(p.DateEnd,'DD/MM/YYYY HH:mm').format("YYYY-MM-DD HH:mm");
            const now = moment().format("YYYY-MM-DD HH:mm");
            if(!(moment(now).isAfter(dateEnd) || await productModel.isSold(p.ProID))){
                result.push(p);
            }
        }


        return result;
    },
    async isOnAuction(username, ProID) {
        const list = await db('historybid')
            .join('products', 'historybid.ProIDHistory', '=', 'products.ProID')
            .where({BidderHistory:username,Bidder:username})
            .select();

        dateFormat({key:list});

        const result = [];

        for(const p of list){
            const dateEnd = moment(p.DateEnd,'DD/MM/YYYY HH:mm').format("YYYY-MM-DD HH:mm");
            const now = moment().format("YYYY-MM-DD HH:mm");
            if(!(moment(now).isAfter(dateEnd) || await productModel.isSold(p.ProID))){
                if(p.ProID === ProID)
                    return true;
            }
        }


        return false;
    }
}