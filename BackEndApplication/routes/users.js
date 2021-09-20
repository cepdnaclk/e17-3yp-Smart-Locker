const express = require('express');
const config = require('../config/databaseConfig');

const router = express.Router();

const connection= config.connection;

router.get('/', (req, res) => {
    connection.query('SELECT * FROM user', (err, rows, fields) => {
        if(err){
           return res.send("Database failure");
        }
        res.send(rows);
    });
});

module.exports = router;

