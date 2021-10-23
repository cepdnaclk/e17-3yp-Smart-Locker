const config = require('../config/databaseConfig');
const express = require('express');

const router = express.Router();
const connection = config.connection;

router.delete('/:locationid', (req, res) => {
  const locationid = req.params.locationid;

  connection.query(
    'DELETE FROM Location WHERE LocationID = ?',
    [locationid],
    (err, result) => {
      if (err) return res.status(500).send('Database Failure');
      return res.send(result);
    }
  );
});
module.exports = router;
