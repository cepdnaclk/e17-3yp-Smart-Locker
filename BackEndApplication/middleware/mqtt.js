// const mqtt = require('mqtt');
// const config = require("../config/databaseConfig");
// const connection = config.connection;

// // aws confuguretion is different
// const client = mqtt.connect('mqtt://broker.hivemq.com');

// let topics = [];

// client.on('connect', () => {
//     for (var count = 0; count < topics.length; count++) {
//         client.subscribe(topics[count], { qos: 1 });
//         console.log(`Subscribed ${topics[count]}`);
//     }
// });

// client.on("message", (topic, message) => {
//     message = JSON.parse(message);
// });

// function sendMessage(topic, message) {
//     client.publish(topic, JSON.stringify(data), { qos: 1 }, (error) => {
//         if (error) {
//             console.error(error)
//         }
//     });
// }