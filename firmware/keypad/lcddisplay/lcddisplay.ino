#include<Wire.h>
#include <LiquidCrystal_I2C.h>

LiquidCrystal_I2C lcd(0x27, 16, 2);  // set the LCD address to 0x27 for a 16 chars and 2 line display

void setup()
{
  lcd.init();                      // initialize the lcd 
  lcd.begin(16, 2);
  lcd.clear();
  lcd.backlight();
  lcd.setCursor(0,0);
}

bool isOn = false;

void loop()
{
  isOn = !isOn;
  if(isOn == false){
     // Print a message to the LCD.
     lcd.clear();
     lcd.setCursor(0,0);
     lcd.print("ON !");
  }
  if(isOn == true){
    lcd.clear();
    lcd.setCursor(0,0);
    lcd.print("OFF !");
  }
  delay(2000);
}
