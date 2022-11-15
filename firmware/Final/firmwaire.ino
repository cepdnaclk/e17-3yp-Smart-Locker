#include <ESP8266WiFi.h>
#include <PubSubClient.h>
#include <ArduinoJson.h>
#include <Wire.h>
#include <Keypad_I2C.h>
#include <Keypad.h>
#include <LiquidCrystal_I2C.h>
#include <Ticker.h>

#define I2CADDR_KEYPAD 0x20
#define I2CADDR_LCD 0x27

#define MSG_BUFFER_SIZE 50

// LCD initiate
LiquidCrystal_I2C lcd(I2CADDR_LCD, 16, 2);
int cursorCol = 0;

// Keyboard initiate
const byte ROWS = 4; //four rows
const byte COLS = 4; //three columns
char keys[ROWS][COLS] = {
  {'1','2','3', 'A'},
  {'4','5','6', 'B'},
  {'7','8','9', 'C'},
  {'*','0','#', 'D'}
};
// Digitran keypad, bit numbers of PCF8574 i/o port
byte rowPins[ROWS] = {0, 1, 2, 3}; //connect to the row pinouts of the keypad
byte colPins[COLS] = {4, 5, 6, 7}; //connect to the column pinouts of the keypad

Keypad_I2C kpd( makeKeymap(keys), rowPins, colPins, ROWS, COLS, I2CADDR_KEYPAD, PCF8574 );

char input[17];
Ticker tickerTimer;

// Wifi Connetion
const char* ssid = "Virus@#$&@#$&&%$@";
const char* password = "12345678";

// mqtt connection
const char* mqtt_server = "test.mosquitto.org";

// locker data
const int lockerNumber = 1;
const int lockerGroupNumber = 1;
String oneTimeToken = "";
String sharedOneTimeToken = "";
int availability = 1;

// Ultrasonic Sensor
const int trigPin = D5;
const int echoPin = D6;
const int LockerLock = D7;

long duration;
int distance;

// Topics
const char* topic_Tokens = "SmartLockerTokenPera/1";
const char* topic_Unlock = "SmartLockerLockerUnlockPera/1/1";
const char* topic_LockerData = "SmartLockerLockerData/1";

// Wifi client creation
char msg[MSG_BUFFER_SIZE];
WiFiClient espClient;
PubSubClient client(espClient);

// Wifi setup function
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
      client.subscribe(topic_Tokens);
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
  DynamicJsonDocument doc(1024);
  
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

  deserializeJson(doc, messageTemp);
  JsonObject obj = doc.as<JsonObject>();

  // Feel free to add more if statements to control more GPIOs with MQTT

  if(topic == topic_Tokens){
    oneTimeToken = String(obj["oneTimeToken"]);
    sharedOneTimeToken = String(obj["sharedOneTimeToken"]);
    availability = int(obj["availability"]);
    Serial.println(oneTimeToken);
    Serial.println(sharedOneTimeToken);
    Serial.println(availability);
    lcd.setCursor(0,0);
    String a = (availability == 1)?"YES":"NO ";
    lcd.print("G:" + String(lockerGroupNumber) + " N:" + String(lockerNumber)+" FREE:"+a);
  }

  if(topic == topic_Unlock){
    //add security features
    digitalWrite(LockerLock,HIGH);
    delay(30000);
    digitalWrite(LockerLock,LOW);
  }
  
}

// Setup LCD display
void setUpLCD(int lockerNo, int groupNo)
{
    lcd.init();                     
    lcd.begin(16, 2);
    lcd.clear();
    lcd.backlight();
    lcd.setCursor(0,0);
    String a = (availability == 1)?"YES":"NO";
    lcd.print("G:" + String(groupNo) + " N:" + String(lockerNo)+" FREE:"+a);
}

// Clear LCD line
void clearLCDLine(int line)
{               
        for(int n = 0; n < 16; n++)
        {
                lcd.setCursor(n, line);
                lcd.print(" ");
        }
}

// Clear input
void clearInput(char input[])
{               
        for(int n = 0; n < 17; n++)
        {
                input[n] = '\0';
        }
}

// Keyboeard setup
void setUpKeyboard()
{
   Wire.begin(); 
   kpd.begin( makeKeymap(keys) );
   Serial.begin(115200);
   Serial.println( "start" );
}

// Erase the last letter of the diplay
void eraseTheLastLetter()
{
    input[--cursorCol] = '\0';
    Serial.println(input);
    lcd.setCursor(0,1);
    lcd.setCursor(cursorCol,1);
    lcd.print(" "); 
}

// validate the password
void checkPassword()
{
  if(oneTimeToken == input || sharedOneTimeToken == input){
    actions_IfPasswordCorrect();
  }
  else{
    actions_IfPasswordInCorrect();
  }
}

// Action for password correct
void actions_IfPasswordCorrect()
{
  clearInput(input);
  cursorCol = 0;
  lcd.setCursor(0,1);
  Serial.println("Correct Password");
  lcd.print("Correct Password"); 
  delay(750);
  clearLCDLine(1);
}

// Action for password incorrect
void actions_IfPasswordInCorrect()
{
  clearInput(input);
  cursorCol = 0;
  lcd.setCursor(0,1);
  Serial.println("Incorrect Retry");
  lcd.print("Incorrect Retry"); 
  delay(750);
  clearLCDLine(1);
}

// get user keyboard inputs
void getUserInput(char key)
{
  input[cursorCol] = key;
  Serial.println(input);
  lcd.setCursor(cursorCol,1);
  lcd.print(key);
  cursorCol++;  
}

// measure distance
void checkEmpty(){
   // Clears the trigPin
  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);

  // Sets the trigPin on HIGH state for 10 micro seconds
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);

  // Reads the echoPin, returns the sound wave travel time in microseconds
  duration = pulseIn(echoPin, HIGH);

  // Calculating the distance
  distance = duration * 0.034 / 2;

  StaticJsonDocument<256> doc;
  JsonObject object = doc.to<JsonObject>();
  
  if (distance < 40)
  {
    Serial.print("There is object");
    object["isEmpty"] = 0;
  }
  else {
    Serial.print("This is empty");
    object["isEmpty"] = 1;
  }
  Serial.print("Duration: ");
  Serial.println(duration);
  Serial.print("Distance: ");
  Serial.println(distance);
  
  object["lockerNumber"] = lockerNumber;
  object["lockerGroupNumber"] = lockerGroupNumber;
  char bufferMessage[256];
  serializeJson(object, bufferMessage);
  client.publish(topic_LockerData, bufferMessage);
//  delay(5);
}

void setup() {
  setUpLCD(lockerNumber, lockerGroupNumber);
  setUpKeyboard();

  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);
  pinMode(LockerLock,OUTPUT);

  Serial.begin(115200);
  setup_wifi();
  client.setServer(mqtt_server, 1883);  // public
  client.setCallback(callback);
  tickerTimer.attach(60,checkEmpty);
}



void loop() {
  // put your main code here, to run repeatedly:
  if (!client.connected()) {
    reconnect();
  }
  
  client.loop();
  // Keypad
  char key = kpd.getKey();  
  if (key){
    if(key == '*'){
      eraseTheLastLetter();
    }
    else if(key == '#'){
      checkPassword();
    }
    else{
      getUserInput(key);
    }
  }
}
