const databaseConnection = require('./config/databaseConfig');

const mqtt = require('mqtt');
const client = mqtt.connect('mqtt://test.mosquitto.org');

client.on('connect', () => {
  client.subscribe('SmartLockerLockerData/X');
});

console.log('Connected Successfully');

client.on('message', async (topic, message) => {
  if (topic === 'SmartLockerLockerData/X') {
    console.log(message.toString());
    const obj = JSON.parse(message.toString());
    //console.log(obj.isEmpty);

    const connection = await databaseConnection.createConnection();
    let table_name = 'locker';
    const updateNonEmpty = `UPDATE ${table_name} SET isEmpty = ${obj.isEmpty}
    WHERE LockerID = "${obj.LockerID}" and LockerLocationID = "${obj.LockerLocationID}"  `;

    try {
      const [res5] = await connection.promise().execute(updateNonEmpty);
      console.log('Successful Entry');
    } catch (error) {
      console.log(error);
    }
  }
});
