// set database password before running the app
const config = require('../config/databaseConfig');
const express = require('express');
const Joi = require('joi');
const { v4: uuidv4 } = require('uuid');
const passwordComplexity = require("joi-password-complexity");

const bcrypt = require('bcrypt'); 


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

    connection.query('SELECT * FROM user WHERE UserEmail = ?',[req.body.email], (err, rows, fields) => {
        if(err) return res.send("Database failure");
        if(rows.length ) return res.status(400).send("User already exist");
        if(!rows.length){
            // hashing password
            const saltRounds = 10;
            bcrypt.hash(req.body.password, saltRounds, function(errHash, hash) {
                connection.query('INSERT INTO user(UserName, UserEmail, UserId, Password, MobileNumber) values (?, ?, ?, ?, ?)',
                [req.body.username,
                req.body.email,
                uuidv4(),
                hash,
                req.body.mobile], (errInsert, resultInsert) => {
                    if(errInsert) return res.send("Database failure");
                    res.send("Registration succeeded");
                });
            });
        }
    });
});

module.exports = router;