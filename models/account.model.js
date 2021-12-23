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

    async findAll(){
        return db('account');
    },

    async degradeAccount(username){
        await db('account')
            .where({ username: username})
            .update({ level: 'bidder' })
    },

    async upgradeAccount(username){
        await db('account')
            .join('upgrade', 'account.username', '=', 'upgrade.id')
            .where({username:username})
            .update({isCheck:false,level:'seller'});
    },

    async cancelUpgradeAccount(username){
        await db('account')
            .join('upgrade', 'account.username', '=', 'upgrade.id')
            .where({username:username})
            .update({isCheck:false});
    },

    async findUpgradeAccount(){
        const list = await db('account')
            .join('upgrade', 'account.username', '=', 'upgrade.id')
            .where({isCheck:false})
            .select();

        for(let i=0;i<list.length;i++){
            list[i].dateStart = moment(list[i].dateStart,'YYYY-MM-DD hh:mm:ss').format('DD/MM/YYYY hh:mm');
        }

        return list;
    },
    async findPasswordByUsername(username) {
        const pass = await db('account').where('username', username).select('password');
        return pass[0].password;
    },
    updatePassword(entity) {
        const username = entity.username;
        delete entity.username;
        return  db('account').where('username', username).update(entity);
    }
}