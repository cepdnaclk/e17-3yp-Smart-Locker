// set database password before running the app
const express = require('express');
const users = require('./routes/users');
const mapclick = require('./routes/mapclick');
const controlPanel = require('./routes/controlPanel');
const purchase = require('./routes/purchase');
const lockerdetails = require('./routes/lockerdetails');
const login = require('./routes/login');
const app = express();

app.use(express.json()); // convert to json
app.use('/api/users', users);
app.use('/api/login', login);
app.use('/api/mapclick', mapclick);
app.use('/api/purchase', purchase);
app.use('/api/lockerdetails', lockerdetails)

// setup the server port
const port = process.env.PORT || 3000;

// listening port 3000
app.listen(port, () => {
    console.log(`Listening port ${port}...`);
});