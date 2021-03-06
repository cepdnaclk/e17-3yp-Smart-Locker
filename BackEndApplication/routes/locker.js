const express = require('express');
const config = require('../config/databaseConfig');

const router = express.Router();
const connection = config.connection;

router.post('/add', (req, res) => {
  const lockerid = req.body.lockerid;
  const lockerlocationid = req.body.lockerlocationid;
  const lockernumber = req.body.lockernumber;

  connection.query(
    'INSERT INTO Locker(LockerID,LockerLocationId,LockerNumber,IsEmpty,Availability) values (?,?,?,?,?)',
    [lockerid, lockerlocationid, lockernumber, true, true],
    (errInsert) => {
      if (errInsert) return res.status(500).send('Database Failure');
      res.send('Entry Successful');
    }
  );
});

router.delete('/delete/:lockerid', (req, res) => {
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

router.get('/', (req, res) => {
  connection.query('SELECT * FROM Locker', (err, result) => {
    if (err) return res.status(500).send('Database Failure');
    res.send(result);
  });
});

module.exports = router;
