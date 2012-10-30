// Testing sketch for DVD LED module with TM1628 IC
// Written by Vasyl Yudin, oct 2012, public domain
// www.blockduino.org
#include <Time.h>
#include <TM1628.h>
// define - data pin D9, clock pin D8 and strobe pin D7
// обьявление портов: DIO - порт D9, CLK - D8, STB - D7
TM1628 dvdLED(9, 8, 7); 

int z=0;
int button;
int state=0;

void setup() {
  dvdLED.begin(ON, 2); 
  setTime(2, 12, 13, 24, 10, 12);
}

void loop() {
  button = dvdLED.getButtons();
   if (button != 0){
     state++;
     dvdLED.clear();
   }
   if (state == 0){
     delay(500);
   } else 
   if (state == 1){
     ShowLEDs();
   } else 
   if (state == 2){
     for(int i =0; i<16; i++)
       ShowTime();
   } else 
   if (state == 3){
     ShowPrint();
   }  else state = 0;
}

void ShowTime(){
  dvdLED.setTime(hour(), minute(), second());
  
  delay(50);
  dvdLED.setLED(z++%8);
  
  if (millis()/500 & 0x01){
      dvdLED.setLEDon(LED_CL1);
      dvdLED.setLEDon(LED_CL2);
    } else {
      dvdLED.setLEDoff(LED_CL1);
      dvdLED.setLEDoff(LED_CL2);
    }
}

void ShowLEDs(){
  for(int i=0;i<19;i++){
    dvdLED.setLEDon(i);
    delay(100);    
  }
  
  for(int i=0;i<19;i++){
    dvdLED.setLEDoff(i);
    delay(25);    
  }
}

void ShowPrint(){
int z=0;
    dvdLED.clear();
    dvdLED.print("b_duino");
    dvdLED.setLED(z++);
    delay(500);
    
// пример взят из reference/Serial_Print.html
    dvdLED.clear();
    dvdLED.print(78);//DEC default
    dvdLED.setLED(z++);
    delay(500);

    dvdLED.clear();
    dvdLED.print(78, BYTE);
    dvdLED.setLED(z++);
    delay(500);

    dvdLED.clear();
    dvdLED.print(78, BIN);
    dvdLED.setLED(z++);
    delay(500);
    
    dvdLED.clear();
    dvdLED.print(78, OCT);
    dvdLED.setLED(z++);
    delay(500);
    
    dvdLED.clear();
    dvdLED.print(78, HEX);
    dvdLED.setLED(z++);
    delay(500);
    
    dvdLED.clear();
    dvdLED.print(-1.2345678);
    dvdLED.setLED(z++);
    delay(500);
    
    dvdLED.clear();
    dvdLED.print(-1.2345678, 4);
    dvdLED.setLED(z++);
    delay(500);
}
