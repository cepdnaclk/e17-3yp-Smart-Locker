const express = require('express');
const config = require('../config/databaseConfig');
const auth = require('../middleware/auth');
var mqtt = require('mqtt');

const router = express.Router();
const connection = config.connection;

router.post('/add', (req, res) => {
    const lockerid = req.body.lockerid;
    const lockerlocationid = req.body.lockerlocationid;
    const lockernumber = req.body.lockernumber;

    connection.query(
        'INSERT INTO Locker(LockerID,LockerLocationId,LockerNumber,IsEmpty,Availability) values (?,?,?,?,?)', [lockerid, lockerlocationid, lockernumber, true, true],
        (errInsert) => {
            if (errInsert) return res.status(500).send('Database Failure');
            res.send('Entry Successful');
        }
    );
});

router.delete('/delete/:lockerid', (req, res) => {
    const lockerid = req.params.lockerid;

    connection.query(
        'DELETE FROM Locker WHERE LockerID = ?', [lockerid],
        (err, result) => {
            if (err) return res.status(500).send('Database Failure');
            return res.send(result);
        }
    );
});

router.get('/', (req, res) => {
    connection.query('SELECT * FROM Locker', (err, result) => {
        if (err) return res.status(500).send('Database Failure');
        res.send(result);
    });
});

router.post('/open', auth, (req, res) => {
    const lockerNumber = req.body.lockerNumber;
    const lockerlocationid = req.body.clusterNumber;

    var options = {
        // host: 'f52e464d5ba446bbb7ce1e8bf72f8221.s2.eu.hivemq.cloud',
        // port: 8883,
        // protocol: 'mqtts',
        // username: 'SmartLocker',
        // password: 'SmartLocker1'
        host: '0447f76c849048d1a140b9601bd5d8df.s2.eu.hivemq.cloud',
        port: 8883,
        protocol: 'mqtts',
        username: 'Smart_LockerUOP',
        password: 'SmartLockerUOP'
    }

    var client = mqtt.connect(options);
    client.on('connect', function() {
        console.log('connected');
        client.publish(`SmartLockerLockerUnlockPeradeniya/${lockerlocationid}/${lockerNumber}`, 'open');
        console.log(`Successfully published Topic: SmartLockerLockerUnlockPeradeniya/${lockerlocationid}/${lockerNumber}`);
    });
    res.send('lock open successful');
});

module.exports = router;