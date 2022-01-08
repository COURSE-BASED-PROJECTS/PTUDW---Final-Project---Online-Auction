import db from '../utils/db.js'


export default {
    addBidder(entity) {
        return db('upgrade').insert(entity);
    },
    async findUsername(username) {
        const list = await db('upgrade').where('id', username);

        if (list.length === 0)
            return null;

        return list[0];
    },
    async patch(entity){
        await db('upgrade').update(entity).where({'id': entity.id});
    },
    async findAmountUpgradeAccount(){
        const list = await db('upgrade')
            .where({isCheck:false, isCancel:false})
            .select();

        return list;
    }
}