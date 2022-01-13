import knexObj from "knex";

export const connectionInfo = {
    host : 'us-cdbr-east-05.cleardb.net',
    port : 3306,
    user : 'b8b1d03a1272ff',
    password : 'f9b2236c',
    database : 'heroku_d91b1e77f575fa2'
}

const knex = knexObj({
    client: 'mysql',
    connection: connectionInfo,
    pool: { min: 0, max: 10 }
});

export default knex;