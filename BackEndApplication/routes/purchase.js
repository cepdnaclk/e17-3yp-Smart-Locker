// set database password before running the app
const config = require('../config/databaseConfig');
const express = require('express');
const Joi = require('joi');

const router = express.Router();
const connection = config.connection;

function generateToken(length) {
    var result = '';
    var characters = 'ABCD0123456789';
    var charactersLength = characters.length;
    for (var i = 0; i < length; i++) {
        result += characters.charAt(Math.floor(Math.random() * charactersLength));
    }
    return result;
}

router.post('/:lockerID', (req, res) => {

    const schema = Joi.object({});

    const result = schema.validate(req.body);

    if (result.error) {
        return res.status(400).send(result.error.details[0].message);
    }
    var lockerID = req.params.lockerID;
    var expireDate = req.body.expireDate;
    var lockerUserID = req.fromUser.jwtUserId;
    var oneTimeToken = generateToken(12);
    var sharedOneTimeToken = generateToken(10);
    var sql = "UPDATE Locker SET Availability=?, ExpireDate=?, LockerUserID=?, OneTimeToken=?, SharedOneTimeToken=? WHERE LockerID=?";

    connection.query(sql, [false, expireDate, lockerUserID, oneTimeToken, sharedOneTimeToken, lockerID],(err, rows) => {
        if (err) return res.status(500).send("Database failure");
        connection.query(
            'SELECT Availability,ExpireDate,LockerUserID,SharedOneTimeToken FROM Locker WHERE LockerID =?', lockerID, (err, rows) => {
                if (err) return res.status(500).send("Database failure");
                if (rows.length == 1) {
                    let purchedLocker = {
                        Availability: rows[0].Availability,
                        ExpireDate: rows[0].ExpireDate,
                        LockerUserID: rows[0].LockerUserID,
                        SharedOneTimeToken: rows[0].SharedOneTimeToken,
                    }
                    const token = jwt.sign({
                            jwtEmail: req.fromUser.jwtEmail,
                            jwtUserId: req.fromUser.jwtUserId,
                        },
                        'smartLocker_jwtPrivateKey'
                    );
                    res.header('x-auth-token', token).send(purchedLocker);
                } else {
                    return res.status(400).send("There only can be a single row");
                }
            })
    })
});

module.exports = router;