const int Locker = D1;

void setup() {
  pinMode(Locker,OUTPUT);

}

void loop() {
  // Let's turn on the relay...
  digitalWrite(Locker, LOW);
  delay(3000);
  
  // Let's turn off the relay...
  digitalWrite(Locker, HIGH);
  delay(3000);
}
