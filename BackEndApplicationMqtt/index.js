const databaseConnection = require('./config/databaseConfig');

const mqtt = require('mqtt');
const client = mqtt.connect('mqtt://test.mosquitto.org');

client.on('connect', () => {
    client.subscribe('SmartLockerLockerData');
});

console.log('Connected Successfully');

client.on('message', async(topic, message) => {
    if (topic === 'SmartLockerLockerData') {
        console.log(message.toString());
        const obj = JSON.parse(message.toString());
        //console.log(obj.isEmpty);
        console.log(obj);
        const connection = await databaseConnection.createConnection();
        let table_name = 'locker';
        const updateNonEmpty = `UPDATE ${table_name} SET isEmpty = ${obj.isEmpty}
    WHERE LockerNumber = "${obj.lockerNumber}" and ClusterID = "${obj.lockerGroupNumber}"  `;

        try {
            const [res5] = await connection.promise().execute(updateNonEmpty);
            console.log('Successful Entry');
        } catch (error) {
            console.log(error);
        }
    }
});