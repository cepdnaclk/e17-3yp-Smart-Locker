const int buzzer = 3;
const int sensor = 4;
const int ledR = 5;
const int ledG = 6;
int state; // 0 close - 1 open wwitch
void setup()
{
  pinMode(sensor, INPUT_PULLUP);
  pinMode(ledR, OUTPUT);
  pinMode(ledG, OUTPUT);
  Serial.begin(9600);
  Serial.println( "start" );
}
void loop()
{
  state = digitalRead(sensor);
  if (state == HIGH){
    Serial.println("1");
    digitalWrite(ledR, HIGH);
    digitalWrite(ledG, LOW);
  }
  else{
    Serial.println("0");
    digitalWrite(ledR, LOW);
    digitalWrite(ledG, HIGH);
  }
  delay(5);
} 
