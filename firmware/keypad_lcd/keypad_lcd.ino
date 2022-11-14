// Address Keypad 0x20
// Address LCD 0x27

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
char input[17];
int cursorCol = 0;

void setup(){
    setUpKeyboard();
    setUpLCD("2", "1");
}

void loop(){
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
    if(password == input){
      actions_IfPasswordCorrect();
    }
}

/*Functions*/
void clearLCDLine(int line)
{               
        for(int n = 0; n < 16; n++)
        {
                lcd.setCursor(n, line);
                lcd.print(" ");
        }
}

void clearInput(char input[])
{               
        for(int n = 0; n < 17; n++)
        {
                input[n] = '\0';
        }
}

void setUpKeyboard()
{
   Wire.begin(); 
   kpd.begin( makeKeymap(keys) );
   Serial.begin(9600);
   Serial.println( "start" );
}
void setUpLCD(String groupNo, String lockerNo)
{
    lcd.init();                     
    lcd.begin(16, 2);
    lcd.clear();
    lcd.backlight();
    lcd.setCursor(0,0);
    lcd.print("Group: " + groupNo + " No: " + lockerNo);
}

void eraseTheLastLetter()
{
    input[--cursorCol] = '\0';
    Serial.println(input);
    lcd.setCursor(0,1);
    lcd.setCursor(cursorCol,1);
    lcd.print(" "); 
}

void checkPassword()
{
  if(password == input){
    actions_IfPasswordCorrect();
  }
  
  if(password != input){
    actions_IfPasswordInCorrect();
  }
}

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

void getUserInput(char key)
{
  input[cursorCol] = key;
  Serial.println(input);
  lcd.setCursor(cursorCol,1);
  lcd.print(key);
  cursorCol++;  
}
