const mysql = require('mysql2');

const createConnection = async() => {
    config = {
        host: 'smart-locker.co4guqlo5yg8.ap-south-1.rds.amazonaws.com',
        user: 'admin',
        password: 'smart-locker',
        database: 'SmartLocker',
    };

    var connection = mysql.createConnection(config);
    try {
        await connection.promise().connect();
        console.log('Connected to DB');
        return connection;
    } catch (e) {
        console.log(e.message);
        console.log('Database connection failed');
        return null;
    }
};

module.exports = {
    createConnection,
};