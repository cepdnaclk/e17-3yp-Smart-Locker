const mysql = require('mysql2');

config = {
  host: 'localhost',
  user: 'root',
  password: 'root', // password //'U761F9JS'
  database: 'SMARTLOCKERSYSTEM', // databasename
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
