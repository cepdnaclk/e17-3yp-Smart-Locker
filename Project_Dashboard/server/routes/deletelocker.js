const config = require('../config/databaseConfig');
const express = require('express');

const router = express.Router();
const connection = config.connection;

router.delete('/:lockerid', (req, res) => {
  const lockerid = req.params.lockerid;

  connection.query(
    'DELETE FROM Locker WHERE LockerID = ?',
    [lockerid],
    (err, result) => {
      if (err) return res.status(500).send('Database Failure');
      return res.send(result);
    }
  );
});
module.exports = router;
