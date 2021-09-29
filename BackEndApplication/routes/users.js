// set database password before running the app
const config = require('../config/databaseConfig');
const express = require('express');
const Joi = require('joi');
const { v4: uuidv4 } = require('uuid');
const passwordComplexity = require("joi-password-complexity");
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const auth = require('../middleware/auth');

const router = express.Router();
const connection = config.connection;

router.post('/', (req, res) => {
    // defining password complexity
    const complexityOptions = {
        min: 8,
        max: 25,
        lowerCase: 1,
        upperCase: 1,
        numeric: 1,
        symbol: 1,
        requirementCount: 4,
    };

    //validating request body
    const schema = Joi.object({
        username: Joi.string().min(8).max(60).required(),
        email: Joi.string().min(3).max(100).required().email(),
        password: new passwordComplexity(complexityOptions).required(),
        mobile: Joi.string().max(10).max(20).required()
    });

    const result = schema.validate(req.body);

    if (result.error) {

        return res.status(400).send(result.error.details[0].message);
    }

    // prevent from injection attacks

    connection.query('SELECT * FROM user WHERE UserEmail = ?', [req.body.email], (err, rows, fields) => {
        if (err) return res.status(500).send("Database failure");
        if (rows.length) return res.status(400).send("User already exist");
        if (!rows.length) {
            // hashing password
            const saltRounds = 10;
            const userId = uuidv4();
            bcrypt.hash(req.body.password, saltRounds, function(errHash, hash) {
                connection.query('INSERT INTO user(UserName, UserEmail, UserID, Password, MobileNumber) values (?, ?, ?, ?, ?)', [
                    req.body.username,
                    req.body.email,
                    userId,
                    hash,
                    req.body.mobile
                ], (errInsert, resultInsert) => {
                    if (errInsert) return res.status(500).send("Database failure");
                    connection.query('SELECT * FROM Location',(errLoc, rowsLoc, fieldsLoc) =>{
                        if(errLoc) return res.status(500).send("Database failure");
                        let signInRes = {
                            locations: rowsLoc,
                            userData: [{
                                UserName: req.body.username,
                                UserEmail: req.body.email
                            }]
                        };
                        const token = jwt.sign({ jwtEmail: req.body.email, jwtUserId: userId}, 'smartLocker_jwtPrivateKey');
                        res.header('x-auth-token', token).send(signInRes);
                    })
                });
            });
        }
    });
});

// a route for get current user information
// the jwt token is validated here
// jwt token validate using signature in middleware/auth.js. So it prevents attacks using json web tokens
router.get('/me', auth, (req, res) => {
    connection.query('SELECT * FROM user WHERE UserEmail = ?', [req.fromUser.jwtEmail], (err, rows, fields) => {
        if (err) return res.status(500).send("Database failure");
        const token = jwt.sign({ jwtEmail: req.fromUser.jwtEmail, jwtUserId: req.fromUser.jwtUserId}, 'smartLocker_jwtPrivateKey');
        res.header('x-auth-token', token).send(rows);
    })
});
module.exports = router;