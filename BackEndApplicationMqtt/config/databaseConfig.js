const mysql = require('mysql2');

const createConnection = async () => {
  config = {
    host: 'localhost',
    user: 'root',
    password: 'U761F9JS',
    database: 'smartlockersystem', // database_name
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
