// Address Keypad 0x20
// Address LCD 0x25

// I2C Keypad for Arduino
// Venkateswara Rao.E 
// 19-oct-2015
// Credits to  @author Alexander Brevig

#include <Wire.h>
#include <Keypad_I2C.h>
#include <Keypad.h>
#include <LiquidCrystal_I2C.h>
#define I2CADDR_KEYPAD 0x20
#define I2CADDR_LCD 0x27

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
LiquidCrystal_I2C lcd(I2CADDR_LCD, 16, 2);

String password = String("AC456DB");
String input = String("");
int cursorCol = 0;

void setup(){
    Wire.begin( ); 
    kpd.begin( makeKeymap(keys) );
    Serial.begin(9600);
    Serial.println( "start" );
    lcd.init();                      // initialize the lcd 
    lcd.begin(16, 2);
    lcd.clear();
    lcd.backlight();
    lcd.setCursor(0,0);
    lcd.print("Group: 2 No: 1");
}

void loop(){
    char key = kpd.getKey();  
    if (key){
      if(key == '*'){
        input = "";
        Serial.println(input);
        lcd.setCursor(0,1);
        clearLCDLine(1);
        cursorCol = 0;
      }
      else{
        input += key;
        Serial.println(input);
        lcd.setCursor(cursorCol,1);
        lcd.print(key);
        cursorCol++;
      }
    }
    if(password == input){
      input = "";
      lcd.setCursor(0,1);
      Serial.println("Correct Password");
      lcd.print("Correct Password");  
    }
}

void clearLCDLine(int line)
{               
        for(int n = 0; n < 16; n++)
        {
                lcd.setCursor(n, line);
                lcd.print(" ");
        }
}
