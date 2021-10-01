// set database password before running the app
const config = require('../config/databaseConfig');
const express = require('express');
const Joi = require('joi');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');

const router = express.Router();

const connection = config.connection;

router.post('/', (req, res) => {
  //validating request body
  const schema = Joi.object({
    email: Joi.string().min(3).max(100).required().email(),
    password: Joi.string().max(25).required(),
  });

  const result = schema.validate(req.body);

  if (result.error) {
    return res.status(400).send(result.error.details[0].message);
  }

  // retrive from database
  connection.query(
    'SELECT * FROM user WHERE UserEmail = ?',
    [req.body.email],
    (err, rows, fields) => {
      if (err) return res.status(500).send('Database failure');
      if (!rows.length) return res.status(400).send('Invalid email address');
      if (rows.length) {
        bcrypt.compare(
          req.body.password,
          rows[0].Password,
          (errHash, resultHash) => {
            if (!resultHash) return res.status(400).send('Incorrect Password');
            connection.query(
              'SELECT * FROM Location',
              (errLoc, rowsLoc, fieldsLoc) => {
                if (errLoc) return res.status(500).send('Database failure');
                connection.query(
                  'SELECT * FROM Locker WHERE LockerUserID = ? AND Availability = ?',
                  [rows[0].UserID, false],
                  (errLocker, rowsLocker, fieldsLocker) => {
                    if (errLocker)
                      return res.status(500).send('Database failure');
                    let logInRes = {
                      locations: rowsLoc,
                      userData: rows,
                      lockers: rowsLocker,
                    };
                    const token = jwt.sign(
                      {
                        jwtEmail: rows[0].UserEmail,
                        jwtUserId: rows[0].UserID,
                      },
                      'smartLocker_jwtPrivateKey'
                    );
                    res.header('x-auth-token', token).send(logInRes);
                  }
                );
              }
            );
          }
        );
      }
    }
  );
});

module.exports = router;
