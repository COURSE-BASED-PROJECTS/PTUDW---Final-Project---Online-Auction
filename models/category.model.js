import db from '../utils/db.js';
import productModel from "../models/product.model.js";


export default {
    async findAll() {
        const list = await db.select().table('categories');

        for (let i = 0; i < list.length; i++) {
            const listsub = await db.select().table('categoriesnext').where({'CatID': list[i].CatID});
            list[i].listsub = listsub;
        }

        return list;
    },
    async findCategory() {
        const list = await db('categories').select();
        return list;
    },

    async findCategoryNext() {
        const list = await db('categoriesnext').select();

        for (const cat of list) {
            cat.amount = await productModel.countByCatIDNext(cat.CatIDNext);
            const Cat = await db('categories').where({CatID: cat.CatID});
            cat.NameParent = Cat[0].CatName;
        }
        return list;
    },
    async findByCatIDNext(CatIDNext) {

        if (CatIDNext === null)
            return null;

        const Cat = await db('categoriesnext').where({CatIDNext: CatIDNext})
        return Cat[0].CatNextName;
    },

    async delCatIDNext(CatIDNext) {
        // del following by step to avoid foreign key error
        const amount = await productModel.countByCatIDNext(CatIDNext);

        if (+amount === 0) {
            await db('categoriesnext').where({CatIDNext: CatIDNext}).del();
        }

    },

    async delCatID(CatID) {
        // del following by step to avoid foreign key error
        const sql = `SELECT COUNT(*) AS amount
                     FROM onlineauction.products,
                          onlineauction.categories,
                          categoriesnext
                     WHERE categories.CatID = categoriesnext.CatID
                       AND categoriesnext.CatIDNext = products.CatIDNext
                       AND categories.CatID = ${CatID}`

        const obj = await db.raw(sql);
        const amount = obj[0][0].amount;

        if (+amount === 0) {
            await db('categoriesnext').where({CatID: CatID}).del();
            await db('categories').where({CatID: CatID}).del();
        }

    },
}