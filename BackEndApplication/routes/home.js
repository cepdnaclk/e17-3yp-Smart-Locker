// set database password before running the app
const express = require('express');
const router = express.Router();

router.get('/', (req, res) => {
    res.send('Home');
});

module.exports = router;