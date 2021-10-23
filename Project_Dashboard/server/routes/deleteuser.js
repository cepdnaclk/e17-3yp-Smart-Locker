const config = require('../config/databaseConfig');
const express = require('express');

const router = express.Router();
const connection = config.connection;

router.delete('/:useremail', (req, res) => {
  const useremail = req.params.useremail;

  connection.query(
    'DELETE FROM User WHERE UserEmail = ?',
    [useremail],
    (err, result) => {
      if (err) return res.status(500).send('Database Failure');
      return res.send(result);
    }
  );
});

module.exports = router;
