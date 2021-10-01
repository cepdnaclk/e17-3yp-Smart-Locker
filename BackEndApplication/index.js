// set database password before running the app
const express = require('express');
const home = require('./routes/home');
const users = require('./routes/users');
const mapclick = require('./routes/mapclick');
const controlPanel = require('./routes/controlPanel');
const accountProfile = require('./routes/accountProfile');
const purchase = require('./routes/purchase');

// create express app
const login = require('./routes/login');
const app = express();

app.use(express.json()); // convert to json
app.use('/', home);
app.use('/api/users', users);
app.use('/api/login', login);
app.use('/api/mapclick', mapclick);
app.use('/api/controlPanel', controlPanel);
app.use('/api/accountProfile', accountProfile);
app.use('/api/purchase', purchase);

// setup the server port
const port = process.env.PORT || 3000;

// listening port 3000
app.listen(port, () => {
    console.log(`Listening port ${port}...`);
});