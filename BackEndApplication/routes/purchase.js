// set database password before running the app
const config = require("../config/databaseConfig");
const express = require("express");
const Joi = require("joi");
const auth = require("../middleware/auth");
const jwt = require("jsonwebtoken");
const randomstring = require("randomstring");

const router = express.Router();
const connection = config.connection;

function generateToken() {
  var result1;
  var result2;
  result1 = randomstring.generate({
    length: 3,
    charset: 'ABCD#*'
  });
  result2 = randomstring.generate({
    length: 7,
    charset: 'numeric'
  });
  return result1.concat(result2);
}

router.post("/:lockerID", auth, (req, res) => {
  const schema = Joi.object({
    expireDate: Joi.string().max(50).required(),
  });

  const result = schema.validate(req.body);

  if (result.error) {
    return res.status(400).send(result.error.details[0].message);
  }
  var lockerID = req.params.lockerID;
  var expireDate = req.body.expireDate;
  var lockerUserID = req.fromUser.jwtUserId;
  var oneTimeToken = generateToken();
  var sharedOneTimeToken = generateToken();
  connection.query(
    "SELECT Availability FROM Locker WHERE LockerID = ?",
    [lockerID],
    (errAvailability, rowsAvailability, fieldsAvailability) => {
      if (errAvailability) return res.status(500).send("Database failure");
      if (rowsAvailability[0].Availability == 0)
        return res.status(400).send("Locker Already Purchased");

      var sql =
        "UPDATE Locker SET Availability=?, ExpireDate=?, LockerUserID=?, OneTimeToken=?, SharedOneTimeToken=? WHERE LockerID=?";

      connection.query(
        sql,
        [
          false,
          expireDate,
          lockerUserID,
          oneTimeToken,
          sharedOneTimeToken,
          lockerID,
        ],
        (err, rows) => {
          if (err) return res.status(500).send("Database failure");
          connection.query(
            "SELECT * FROM Locker WHERE LockerID =?",
            [lockerID],
            (errLocker, rowsLocker, fields) => {
              if (errLocker) return res.status(500).send("Database failure");
              if (rowsLocker.length == 1) {
                const token = jwt.sign(
                  {
                    jwtEmail: req.fromUser.jwtEmail,
                    jwtUserId: req.fromUser.jwtUserId,
                  },
                  "smartLocker_jwtPrivateKey"
                );
                res
                  .header("x-auth-token", token)
                  .send({ purchasedLocker: rowsLocker[0] });
              } else {
                return res.status(400).send("There only can be a single row");
              }
            }
          );
        }
      );
    }
  );
});

module.exports = router;
