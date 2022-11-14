#include <ESP8266WiFi.h>
#include <PubSubClient.h>
#include <ArduinoJson.h>

#define MSG_BUFFER_SIZE 50

const char* ssid = "Eng-Student";
const char* password = "3nG5tuDt";

//const char* mqtt_server = "10.40.18.10";
const char* mqtt_server = "test.mosquitto.org";
//const char* topic_batteryReady = "3326project/smartbuilding/pv/battery/ready";
const char* topic_dadoright = "dadoright";

char msg[MSG_BUFFER_SIZE];

WiFiClient espClient;
PubSubClient client(espClient);

void setup_wifi() {

  delay(10);
  // We start by connecting to a WiFi network
  Serial.println();
  Serial.print("Connecting to ");
  Serial.println(ssid);

  WiFi.mode(WIFI_STA);
  WiFi.begin(ssid, password);

  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }

  randomSeed(micros());

  Serial.println("");
  Serial.println("WiFi connected");
  Serial.println("IP address: ");
  Serial.println(WiFi.localIP());
}

void reconnect() {
  // Loop until we're reconnected
  while (!client.connected()) {
    Serial.print("Attempting MQTT connection...");
    
    // Create a random client ID
    String clientId = "ESP8266Client-";
    clientId += String(random(0xffff), HEX);
    
    // Attempt to connect
    if (client.connect(clientId.c_str())) {
      Serial.println("connected");
      client.subscribe(topic_dadoright);
    } else {
      Serial.print("failed, rc=");
      Serial.print(client.state());
      Serial.println(" try again in 5 seconds");
      // Wait 5 seconds before retrying
      delay(5000);
    }
  }
}
void callback(String topic, byte* message, unsigned int length) {
  //DynamicJsonDocument doc(1024);
  
  Serial.print("Message arrived on topic: ");
  Serial.print(topic);
  Serial.println();
  Serial.print(" Message: ");
  
  String messageTemp;
  
  for (int i = 0; i < length; i++) {
    Serial.print((char)message[i]);
    messageTemp += (char)message[i];
  }
  Serial.println();

  //deserializeJson(doc, messageTemp);
  //JsonObject obj = doc.as<JsonObject>();

  // Feel free to add more if statements to control more GPIOs with MQTT

  if(topic==dadoright){
    Serial.print("Connected");
  }
  
  


void setup() {
  Serial.begin(115200);
  setup_wifi();
  client.setServer(mqtt_server, 1883);  // public
  client.setCallback(callback);
}

void loop() {
  // put your main code here, to run repeatedly:
  if (!client.connected()) {
    reconnect();
  }
  client.loop();

  snprintf(msg,MSG_BUFFER_SIZE,"%s","Sending Msg");
  client.publish(dadoright,msg);
}
