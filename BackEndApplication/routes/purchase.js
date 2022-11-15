const config = require("../config/databaseConfig");
const express = require("express");
const Joi = require("joi");
const auth = require("../middleware/auth");
const randomstring = require("randomstring");
const Cryptr = require("cryptr");
const cryptr = new Cryptr("smartlocker_secretkey");
var mqtt = require("mqtt");

const router = express.Router();
const connection = config.connection;

function generateToken() {
  var result1;
  var result2;
  result1 = randomstring.generate({
    length: 3,
    charset: "ABCD#*",
  });
  result2 = randomstring.generate({
    length: 7,
    charset: "numeric",
  });
  return result1.concat(result2);
}

router.post("/direct", auth, (req, res) => {
  const schema = Joi.object({
    expireDate: Joi.string().max(50).required(),
    lockerNumber: Joi.string().max(50).required(),
    clusterNumber: Joi.string().max(50).required(),
  });

  const result = schema.validate(req.body);

  if (result.error) {
    return res.status(400).send(result.error.details[0].message + "aaa");
  }

  var lockerNumber = parseInt(req.body.lockerNumber);
  var clusterID = req.body.clusterNumber;
  var expireDate = req.body.expireDate;
  var lockerUserID = req.fromUser.jwtUserId;
  var oneTimeToken = generateToken();
  var sharedOneTimeToken = generateToken();
  const encryptedOneTimeToken = cryptr.encrypt(oneTimeToken);
  const encryptedsharedOneTimeToken = cryptr.encrypt(sharedOneTimeToken);

  connection.query(
    "SELECT Availability FROM Locker WHERE LockerNumber = ? AND ClusterID = ?",
    [lockerNumber, clusterID],
    (errAvailability, rowsAvailability, fieldsAvailability) => {
      if (errAvailability) return res.status(500).send("Database failure");
      if (rowsAvailability[0].Availability == 0)
        return res.status(400).send("Locker Already Purchased");

      var sql =
        "UPDATE Locker SET Availability=?, ExpireDate=?, LockerUserID=?, OneTimeToken=?, SharedOneTimeToken=? WHERE LockerNumber = ? AND ClusterID = ?";

      connection.query(
        sql,
        [
          false,
          expireDate,
          lockerUserID,
          encryptedOneTimeToken,
          encryptedsharedOneTimeToken,
          lockerNumber,
          clusterID,
        ],
        (err, rows) => {
          if (err) return res.status(500).send("Database failure");
          connection.query(
            "SELECT * FROM Locker WHERE LockerNumber = ? AND ClusterID = ?",
            [lockerNumber, clusterID],
            (errLocker, rowsLocker, fields) => {
              if (errLocker) return res.status(500).send("Database failure");
              /*****************************************************************/
              var client = mqtt.connect("mqtt://test.mosquitto.org");
              client.on("connect", function () {
                console.log("connected purchase 1");
                const data = {
                  oneTimeToken: `${oneTimeToken}`,
                  sharedOneTimeToken: `${sharedOneTimeToken}`,
                  availability: 0,
                };
                const stringData = JSON.stringify(data)
                client.publish(`SmartLockerTokenPera/${clusterID}/${lockerNumber}`,"purchase 1");
              });
              /*****************************************************************/
              res.send({ purchasedLocker: rowsLocker[0] });
            }
          );
        }
      );
    }
  );
});

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
  const encryptedOneTimeToken = cryptr.encrypt(oneTimeToken);
  const encryptedsharedOneTimeToken = cryptr.encrypt(sharedOneTimeToken);
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
          encryptedOneTimeToken,
          encryptedsharedOneTimeToken,
          lockerID,
        ],
        (err, rows) => {
          if (err) return res.status(500).send("Database failure");
          connection.query(
            "SELECT * FROM Locker WHERE LockerID =?",
            [lockerID],
            (errLocker, rowsLocker, fields) => {
              if (errLocker) return res.status(500).send("Database failure");
              /******************************************************************/
              const lockerNumber = rowsLocker[0].lockerNumber;
              const clusterID = rowsLocker[0].clusterID;
              var client = mqtt.connect("mqtt://test.mosquitto.org");
              client.on("connect", function () {
                console.log("connected purchase 2");
                const data = {
                  oneTimeToken: `${oneTimeToken}`,
                  sharedOneTimeToken: `${sharedOneTimeToken}`,
                  availability: 0,
                };
                const stringData = JSON.stringify(data)
                console.log(`Topic Name: SmartLockerTokenPera/${clusterID}/${lockerNumber}`);
                console.log(`${data}`);
                console.log(`${stringData}`);
                client.publish(`SmartLockerTokenPera/${clusterID}/${lockerNumber}`, "purchase 2");
              });
              /******************************************************************/
              res.send({ purchasedLocker: rowsLocker[0] });
            }
          );
        }
      );
    }
  );
});

module.exports = router;
