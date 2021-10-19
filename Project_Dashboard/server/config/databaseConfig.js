const mysql = require('mysql2');

config = {
  user: 'root',
  host: 'localhost',
  password: 'U761F9JS',
  database: 'SMARTLOCKERSYSTEM',
};

const db = mysql.createConnection(config);

db.connect(function (err) {
  if (err) {
    return console.log('error connecting:' + JSON.stringify(err, undefined, 2));
  }
  console.log('Successfully Connected to the DB');
});

module.exports = {
  connection: mysql.createConnection(config),
};
