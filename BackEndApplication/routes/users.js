const express = require('express');
const Joi = require('joi');
const { v4: uuidv4 } = require('uuid');
const config = require('../config/databaseConfig');

const router = express.Router();

const connection= config.connection;

router.post('/', (req, res) => {

    //validating request body
    const schema = Joi.object({
        username: Joi.string().min(8).max(60).required(),
        email: Joi.string().min(3).max(100).required().email(),
        password: Joi.string().min(8).max(255).required(),
        mobile: Joi.string().max(10).max(20).required()
    });

    const result = schema.validate(req.body);

    if(result.error){
        return res.status(400).send(result.error.details[0].message);
    }

    // prevent from injection attacks
    connection.query('SELECT * FROM user WHERE UserEmail = ?',[req.body.email], (err, rows, fields) => {
        if(err) return res.send("Database failure");
        if(rows.length ) return res.status(400).send("User already exist");
        if(!rows.length){
            connection.query('INSERT INTO user(UserName, UserEmail, UserId, Password, MobileNumber) values (?, ?, ?, ?, ?)',
            [req.body.username,
            req.body.email,
            uuidv4(),
            req.body.password,
            req.body.mobile], (errInsert, resultInsert) => {
                if(errInsert) return res.send("Database failure");
                res.send("Registration succeeded");
            });
        }
    });
});

module.exports = router;
