const express = require('express');
const router = express.Router();

router.get('/', (req, res) => {
    res.send({
        title: 'API REST NEO LOOT',
        version: '1.0.8',
        author: 'MaoParadise',
        message : 'to obtain the list of products, use the GET method and the url: /api/products',
        swagger : 'https://neo-loot-prototype2.netlify.app/'
    });
});

module.exports = router;