if(process.env.NODE_ENV !== 'production') {
    require('dotenv').config();
}

module.exports = {
 
    database: {
        host: process.env.BDHOST || 'localhost',
        user: process.env.BDUSER,
        password: process.env.PASSWORD,
        database: process.env.DATABASE
    }
}