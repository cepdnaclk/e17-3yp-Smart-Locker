const config = require('../config/databaseConfig');
const express = require('express');

const router = express.Router();
const connection = config.connection;

router.get('/', (req, res) => {
  connection.query('SELECT * FROM Locker', (err, result) => {
    if (err) return res.status(500).send('Database Failure');
    res.send(result);
  });
});

module.exports = router;
