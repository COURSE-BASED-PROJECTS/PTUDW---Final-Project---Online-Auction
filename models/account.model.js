import db from '../utils/db.js'


export default {
    addAccount(account) {
        return db('account').insert(account);
    },
    async findByUsername(username) {
        const list = await db('account').where('username', username);

        if (list.length === 0)
            return null;

        return list[0];
    },
}