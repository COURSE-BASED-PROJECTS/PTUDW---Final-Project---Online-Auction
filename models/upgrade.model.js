import db from '../utils/db.js'


export default {
    addBidder(entity) {
        return db('upgrade').insert(entity);
    }
}