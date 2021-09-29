const mysql = require('mysql2');

config = {
    host: 'localhost',
    user: 'root',
    password: 'maths123456', // password
    database: 'SMARTLOCKERSYSTEM' // databasename
}

var connection = mysql.createConnection(config);

connection.connect(function(err) {
    if (err) {
        return console.log('error connecting:' + JSON.stringify(err, undefined, 2));
    }
    console.log('connected successfully to DB.');
});

module.exports = {
    connection: mysql.createConnection(config)
}