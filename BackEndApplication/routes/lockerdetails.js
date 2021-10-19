// set database password before running the app
const config = require("../config/databaseConfig");
const express = require("express");
const auth = require("../middleware/auth");
const Joi = require("joi");
const jwt = require("jsonwebtoken");

const router = express.Router();
const connection = config.connection;

router.get("/", auth, (req, res) => {
  const schema = Joi.object({});

  const result = schema.validate(req.body);

  if (result.error) {
    return res.status(400).send(result.error.details[0].message);
  }

  connection.query(
    "SELECT * FROM Locker WHERE LockerUserID = ? AND Availability = false",
    [req.fromUser.jwtUserId],
    (err, rows, fields) => {
      if (err) return res.status(500).send("Database failure");
      if (!rows.length) return res.status(400).send("Locker does not exist");
      if (rows.length) {
        connection.query(
          "SELECT Location.* FROM Location INNER JOIN Locker ON LocationID = LockerLocationID WHERE  LockerUserID = ? AND Availability = false",
          [req.fromUser.jwtUserId],
          (errloc, rowsloc, fieldsloc) => {
            if (errloc) return res.status(500).send("Database failure");
            if (!rows.length)
              return res.status(400).send("Location does not exist");
            const token = jwt.sign(
              {
                jwtEmail: req.fromUser.jwtEmail,
                jwtUserId: req.fromUser.jwtUserId,
              },
              "smartLocker_jwtPrivateKey"
            );
            var lockerdetailsRes = {
              lockerdetails: rows,
              location: rowsloc,
            };
            res.header("x-auth-token", token).send(lockerdetailsRes);
          }
        );
      }
    }
  );
});

module.exports = router;
