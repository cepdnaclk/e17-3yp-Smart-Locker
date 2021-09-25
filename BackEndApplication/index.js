const express = require('express');
const home = require('./routes/home');
const users = require('./routes/users');

// create express app
const app = express();

app.use(express.json()); // convert to json
app.use('/', home);
app.use('/api/users', users);

// setup the server port
const port = process.env.PORT || 3000;

// listening port 3000
app.listen(port, () => {
    console.log(`Listening port ${port}...`)
});