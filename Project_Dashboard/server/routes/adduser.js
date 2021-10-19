const config = require('../config/databaseConfig');
const express = require('express');
const bcrypt = require('bcrypt');
const { v4: uuidv4 } = require('uuid');

const router = express.Router();
const connection = config.connection;

router.post('/', (req, res) => {
  const username = req.body.username;
  const useremail = req.body.useremail;
  const usermobilenumber = req.body.usermobilenumber;
  const userpassword = req.body.userpassword;

  const saltRounds = 10;
  const UserId = uuidv4();

  connection.query(
    'SELECT * FROM User WHERE UserEmail = ?',
    [useremail],
    (err, result, fields) => {
      if (err) return res.status(500).send('Database Failure');
      if (result.length) return res.status(400).send('User already exist');

      if (!result.length) {
        bcrypt.hash(userpassword, saltRounds, function (errhash, hash) {
          connection.query(
            "INSERT INTO User(UserName, UserEmail, UserID, Password, MobileNumber, UserRoleID) values (?, ?, ?, ?, ?, '2')",
            [username, useremail, UserId, hash, usermobilenumber],
            (errInsert, ResultInsert) => {
              if (errInsert) return res.status(500).send(errInsert);
              res.send('Entry Successful');
            }
          );
        });
      }
    }
  );
});

module.exports = router;
