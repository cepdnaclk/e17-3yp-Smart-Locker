const mysql = require('mysql2');

config = {
    host: 'smart-locker.co4guqlo5yg8.ap-south-1.rds.amazonaws.com',
    user: 'admin',
    password: 'smart-locker',
    database: 'SmartLocker', // databasename
};

var connection = mysql.createConnection(config);

connection.connect(function(err) {
    if (err) {
        return console.log('error connecting:' + JSON.stringify(err, undefined, 2));
    }
    console.log('connected successfully to DB.');
});

module.exports = {
    connection: mysql.createConnection(config),
};