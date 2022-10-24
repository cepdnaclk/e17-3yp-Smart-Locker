// set database password before running the app
const express = require('express');
const cors = require('cors');

const users = require('./routes/users');
const mapclick = require('./routes/mapclick');
const controlPanel = require('./routes/controlPanel');
const purchase = require('./routes/purchase');
const lockerdetails = require('./routes/lockerdetails');
const login = require('./routes/login');
const admin = require('./routes/admin');
const locker = require('./routes/locker');
const location = require('./routes/location');

const app = express();
// Application Security
const helmet = require('helmet');
const rateLimit = require('express-rate-limit');

const limiter = rateLimit({
  windowMs: 1000 * 60 * 1, // in ms
  max: 10,
});

app.use(helmet());
//app.use(limiter);

app.use(express.json()); // convert to json
app.use(cors());

app.use('/api/users', limiter, users);
app.use('/api/login', limiter, login);
app.use('/api/mapclick', limiter, mapclick);
app.use('/api/purchase', limiter, purchase);
app.use('/api/lockerdetails', limiter, lockerdetails);
app.use('/api/admin', admin);
app.use('/api/locker', locker);
app.use('/api/location', location);

// setup the server port
const port = process.env.PORT || 3001;

// listening port 3000
app.listen(port, () => {
  console.log(`Listening port ${port}...`);
});
