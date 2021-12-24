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
            const dateEnd = moment(p.DateEnd,'DD/MM/YYYY hh:mm').format("YYYY-MM-DD hh:mm");
            const now = moment().format("YYYY-MM-DD hh:mm");
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
            const dateEnd = moment(p.DateEnd,'DD/MM/YYYY hh:mm').format("YYYY-MM-DD hh:mm");
            const now = moment().format("YYYY-MM-DD hh:mm");

            if(!(moment(now).isAfter(dateEnd) || await productModel.isSold(p.ProID))){
                result.push(p);
            }
        }

        return result;
    },

}