const express = require('express');
const config = require('../config/databaseConfig');

const router = express.Router();
const connection = config.connection;

router.get('/', (req, res) => {
  connection.query('SELECT * FROM Location', (err, result) => {
    if (err) return res.status(500).send('Database Failure');
    res.send(result);
  });
});

module.exports = router;
