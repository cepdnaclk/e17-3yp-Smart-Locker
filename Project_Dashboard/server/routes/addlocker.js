const express = require('express');
const config = require('../config/databaseConfig');

const router = express.Router();
const connection = config.connection;

router.post('/', (req, res) => {
  const lockerid = req.body.lockerid;
  const lockerlocationid = req.body.lockerlocationid;
  const lockernumber = req.body.lockernumber;

  connection.query(
    'INSERT INTO Locker(LockerID,LockerLocationID,LockerNumber,IsEmpty,Availability) values (?,?,?,?,?)',
    [lockerid, lockerlocationid, lockernumber, true, true],
    (errInsert) => {
      if (errInsert) return res.status(500).send('Database Failure');
      res.send('Entry Successful');
    }
  );
});

module.exports = router;
