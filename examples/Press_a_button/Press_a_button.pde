

// Testing sketch for DVD module with TM1628 IC
// Written by Vasyl Yudin, public domain
// www.blockduino.org

#include <TM1628.h>
// define - data pin 8, clock pin 9 and strobe pin 7
TM1628 dvdLED(9, 8, 7);
int button;
void setup() {
  dvdLED.begin(ON, 2);
}

void loop() {     
  button = dvdLED.getButtons();
  if (button != 0){
    dvdLED.clear();
    for(int i=0;i<8;i++){
      if((button >> i) & 0x01) {
        dvdLED.print("No");
        dvdLED.print(i);
        dvdLED.print('-');
        dvdLED.print(button);
      }
    }
  } else {
    dvdLED.setCursor(0);
    dvdLED.print(" button");
  }
  delay(100);  
}
