const express = require('express');
const app = express();
const cors = require('cors');

const adduser = require('./routes/adduser');
const addlocation = require('./routes/addlocation');
const addlocker = require('./routes/addlocker');
const senduser = require('./routes/senduser');
const sendlocker = require('./routes/sendlocker');
const sendlocation = require('./routes/sendlocation');
const deleteuser = require('./routes/deleteuser');
const deletelocker = require('./routes/deletelocker');
const deletelocation = require('./routes/deletelocation');

const port = process.env.PORT || 3001;

app.listen(port, () => {
  console.log(`Listening to Port ${port}...`);
});

app.use(cors());
app.use(express.json());
app.use('/adduser', adduser);
app.use('/addlocation', addlocation);
app.use('/addlocker', addlocker);
app.use('/senduser', senduser);
app.use('/sendlocker', sendlocker);
app.use('/sendlocation', sendlocation);
app.use('/deleteuser', deleteuser);
app.use('/deletelocker', deletelocker);
app.use('/deletelocation', deletelocation);
