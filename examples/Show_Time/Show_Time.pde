// Testing sketch for DVD LED module with TM1628 IC
// Written by Vasyl Yudin, oct 2012, public domain
// www.blockduino.org

#include <TM1628.h>
// define - data pin D9, clock pin D8 and strobe pin D7
// обьявление портов: DIO - порт D9, CLK - D8, STB - D7
TM1628 dvdLED(9, 8, 7); 

int z=0;

void setup() {
  dvdLED.begin(ON, 2); 
  setTime(2, 12, 13, 24, 10, 12);   
  dvdLED.setLEDon(LED_CL1);
  dvdLED.setLEDon(LED_CL2);
}

void loop() {
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
