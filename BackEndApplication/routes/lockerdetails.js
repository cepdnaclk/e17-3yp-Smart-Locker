// set database password before running the app
const config = require('../config/databaseConfig');
const express = require('express');

const router = express.Router();
const connection = config.connection;

router.get('/:lockerID', (req, res) => {

    const schema = Joi.object({});

    const result = schema.validate(req.body);

    if (result.error) {
        return res.status(400).send(result.error.details[0].message);
    }

    connection.query('SELECT * FROM Locker WHERE LockerID = ?', req.params.lockerID, (err, rows, fields) => {
        if (err) return res.status(500).send("Database failure");
        if (rows.length == 1) {
            res.send(rows[0]);
        } else {
            return res.status(400).send("There only can be a single row");
        }
    })

});

module.exports = router;