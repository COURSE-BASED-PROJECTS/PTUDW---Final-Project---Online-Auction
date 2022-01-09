import db from '../utils/db.js'


export default {
    async addLockAuctionAccount(entity) {
        return db('lockauction').insert(entity);
    },
    async isLock(username,ProID){
        const list = await db('lockauction').where({id:username,product:ProID}).select();

        if(list.length === 0){
            return false;
        }else{
            return true;
        }
    }

}