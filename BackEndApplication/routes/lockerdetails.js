// Secure
const config = require("../config/databaseConfig");
const express = require("express");
const auth = require("../middleware/auth");
const Joi = require("joi");

const router = express.Router();
const connection = config.connection;

router.get("/", auth, (req, res) => {
  const schema = Joi.object({});

  const result = schema.validate(req.body);

  if (result.error) {
    return res.status(400).send(result.error.details[0].message);
  }

  connection.query(
    "SELECT DISTINCT * FROM Location INNER JOIN Locker ON LocationID = LockerLocationID WHERE  LockerUserID = ? AND Availability = false",
    [req.fromUser.jwtUserId],
    (errloc, rowsloc, fieldsloc) => {
      if (errloc) return res.status(500).send("Database failure");
      var lockerdetailsRes = {
        lockerdetails: rowsloc
      };
      res.send(lockerdetailsRes);
    }
  );
});

module.exports = router;
