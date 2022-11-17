const databaseConnection = require('./config/databaseConfig');

const mqtt = require('mqtt');

var options = {
    host: 'f52e464d5ba446bbb7ce1e8bf72f8221.s2.eu.hivemq.cloud',
    port: 8883,
    protocol: 'mqtts',
    username: 'SmartLocker',
    password: 'SmartLocker1'
}

var client = mqtt.connect(options);

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
        let table_name = 'Locker';
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