import db from '../utils/db.js'
import moment from "moment";

export default {
    addAccount(account) {
        return db('account').insert(account);
    },
    updateInfoAccount(info) {
        const username = info.username;
        delete info.username;
        return db('account').where('username', username).update(info);
    },
    async findByUsername(username) {
        const list = await db('account').where('username', username);

        if (list.length === 0)
            return null;

        return list[0];
    },

    async findByEmail(email) {
        const list = await db('account').where('email', email);

        if (list.length === 0)
            return null;

        return list[0];
    },

    async findAll(){
        return db('account');
    },

    async degradeAccount(username){
        await db('account')
            .where({ username: username})
            .update({ level: 'bidder' });
        await db('upgrade')
            .where({ id: username})
            .update({ isCancel: 1 })
    },

    async upgradeAccount(username){
        await db('account')
            .join('upgrade', 'account.username', '=', 'upgrade.id')
            .where({username:username})
            .update({isCheck:true,level:'seller'});
    },

    async cancelUpgradeAccount(username){
        await db('upgrade')
            .where({id: username})
            .update({isCheck:true, isCancel:true});
    },

    async findUpgradeAccount(limit, offset){
        const list = await db('account')
            .join('upgrade', 'account.username', '=', 'upgrade.id')
            .where({isCheck:false, isCancel:false})
            .limit(limit)
            .offset(offset)
            .select();

        for(let i=0;i<list.length;i++){
            list[i].dateStart = moment(list[i].dateStart,'YYYY-MM-DD hh:mm:ss').format('DD/MM/YYYY hh:mm');
        }

        return list;
    },

    async getPointAccount(username){
        const list = await db('account').where('username',username);
        return list[0].point;
    },
    async getSumBidAccount(username){
        const list = await db('account').where('username',username);
        return list[0].sumBid;
    },
    async getNameByUsername(username){
        const obj = await db('account').where('username',username).select('name');
        return obj[0].name;
    },
    async lockAccount(username) {
        await db('account')
            .where({ username: username})
            .update({ isLock: 1 })
    },
    async unlockAccount(username) {
        await db('account')
            .where({ username: username})
            .update({ isLock: 0 })
    },
    async deleteAccount(username) {
        await db('account')
            .where({username: username})
            .delete()
    }
}