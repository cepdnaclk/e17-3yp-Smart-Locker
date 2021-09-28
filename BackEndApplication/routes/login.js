// set database password before running the app
const config = require('../config/databaseConfig');
const express = require('express');
const Joi = require('joi');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');

const router = express.Router();

const connection = config.connection;

router.post('/', (req, res) => {

    //validating request body
    const schema = Joi.object({
        email: Joi.string().min(3).max(100).required().email(),
        password: Joi.string().min(8).max(25).required()
    });

    const result = schema.validate(req.body);

    if (result.error) {
        return res.status(400).send(result.error.details[0].message);
    }

    // retrive from database
    connection.query('SELECT * FROM user WHERE UserEmail = ?', [req.body.email], (err, rows, fields) => {
        if (err) return res.status(500).send("Database failure");
        if (!rows.length) return res.status(400).send("Invalid email address");
        if (rows.length) {
            bcrypt.compare(req.body.password, rows[0].Password, (errHash, resultHash) => {
                if (!resultHash) return res.status(400).send("Incorrect Password");
                const token = jwt.sign({ jwtEmail: rows[0].UserEmail }, 'smartLocker_jwtPrivateKey');
                res.header('x-auth-token', token).send('Successfully logged');
            });
        }
    });
});

module.exports = router;