const config = require('../config/databaseConfig');
const express = require('express');

const router = express.Router();
const connection = config.connection;

router.post('/', (req, res) => {
  const locationid = req.body.locationid;
  const locationlongitude = req.body.locationlongitude;
  const locationlatitude = req.body.locationlatitude;
  const locationdescription = req.body.locationdescription;
  //const locationurl = req.body.locationurl;

  connection.query(
    'SELECT * FROM Location WHERE LocationID = ?',
    [locationid],
    (err, result) => {
      if (err) return res.status(500).send('Database Failure');
      if (result.length)
        return res.status(400).send('LocationID Already Exists');

      if (!result.length) {
        connection.query(
          'INSERT INTO Location(LocationID,Longitude,Latitude,LocationDescription) values (?,?,?,?)',
          [
            locationid,
            locationlongitude,
            locationlatitude,
            locationdescription,
          ],
          (errlocation) => {
            if (errlocation) return res.status(500).send('DatabaseFailure');
            res.send('entry successful');
          }
        );
      }
    }
  );
});

module.exports = router;
