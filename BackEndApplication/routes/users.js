const express = require('express');
const Joi = require('joi');
const config = require('../config/databaseConfig');

const router = express.Router();

const connection= config.connection;

router.get('/', (req, res) => {

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

    connection.query('SELECT * FROM user', (err, rows, fields) => {
        if(err){
           return res.send("Database failure");
        }
        res.send(rows);
    });
});

module.exports = router;
