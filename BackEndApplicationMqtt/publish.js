const databaseConnection = require("./config/databaseConfig");

const mqtt = require("mqtt");


publisher = async() => {
  const connection = await databaseConnection.createConnection();
  let table_name = "Locker";
  const getLockerData = `SELECT * FROM ${table_name}`;
  let lockerData;
  try {
    const [response] = await connection.promise().execute(getLockerData);
    lockerData = response;
    console.log("Successful Retrieved");
  } catch (error) {
    console.log(error.message);
  }
  const client = mqtt.connect("mqtt://test.mosquitto.org");
  client.on("connect", function () {
    console.log("connected to publishing availability");
    for (let i = 0; i < lockerData.length; i++) {
      lockerlocationid = lockerData[i].ClusterID;
      lockerNumber = lockerData[i].LockerNumber;
      const data = { availability: lockerData[i].Availability };
      const stringData = JSON.stringify(data);
      console.log(
        `${stringData}\tTopic: SmartLockerAvailability/${lockerlocationid}/${lockerNumber}`
      );
      client.publish(
        `SmartLockerAvailability/${lockerlocationid}/${lockerNumber}`,
        stringData
      );
    }
  });
};


setInterval(publisher, 5000);

