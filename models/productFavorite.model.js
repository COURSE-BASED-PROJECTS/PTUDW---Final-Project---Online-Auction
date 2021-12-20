import db from '../utils/db.js'
import dateFormat from "../utils/dateFormat.js";

export default {

    async findFavorite(username){
        let list = await db('favorite')
            .join('products', 'favorite.ProID', '=', 'products.ProID')
            .where('username',username)
            .select();

        dateFormat({key:list});

        return list
    },
    async cancelFavorite(ProID,username){
        await db('favorite')
            .where({ProID:ProID,username:username})
            .del();
    },

    async addFavorite(entity){
        const list = await db('favorite').where({ProID:entity.ProID,username:entity.username});

        if(list.length === 0)
            await db('favorite').insert(entity);
    },


}