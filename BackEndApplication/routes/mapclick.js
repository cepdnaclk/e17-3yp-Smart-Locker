// Secure
const config = require("../config/databaseConfig");
const express = require("express");
const Joi = require("joi");
const auth = require("../middleware/auth");

const router = express.Router();
const connection = config.connection;

router.get("/:locationID", auth, (req, res) => {
  //validating request body
  const schema = Joi.object({});

  const result = schema.validate(req.body);

  if (result.error) {
    return res.status(400).send(result.error.details[0].message);
  }

  // retrive from database
  connection.query(
    "SELECT * FROM Locker WHERE LockerLocationId = ? AND Availability = true AND IsEmpty = true",
    [req.params.locationID],
    (err, rows, fields) => {
      if (err) return res.status(500).send("Database failure");
      res.send({ availableLockers: rows });
    }
  );
});

module.exports = router;
