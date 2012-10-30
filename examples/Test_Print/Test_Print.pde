// Testing sketch for DVD LED module with TM1628 IC
// Written by Vasyl Yudin, oct 2012, public domain
// www.blockduino.org

#include <TM1628.h>
// define - data pin D9, clock pin D8 and strobe pin D7
// обьявление портов: DIO - порт D9, CLK - D8, STB - D7
TM1628 dvdLED(9, 8, 7); 

void setup() {
  dvdLED.begin(ON, 2);
}

void loop() {
int z=0;
    dvdLED.clear();
    dvdLED.print("b_duino");
    dvdLED.setLED(z++);
    delay(1000);
    
// пример взят из reference/Serial_Print.html
    dvdLED.clear();
    dvdLED.print(78);//DEC default
    dvdLED.setLED(z++);
    delay(1000);

    dvdLED.clear();
    dvdLED.print(78, BYTE);
    dvdLED.setLED(z++);
    delay(1000);

    dvdLED.clear();
    dvdLED.print(78, BIN);
    dvdLED.setLED(z++);
    delay(1000);
    
    dvdLED.clear();
    dvdLED.print(78, OCT);
    dvdLED.setLED(z++);
    delay(1000);
    
    dvdLED.clear();
    dvdLED.print(78, HEX);
    dvdLED.setLED(z++);
    delay(1000);
    
    dvdLED.clear();
    dvdLED.print(-1.2345678);
    dvdLED.setLED(z++);
    delay(1000);
    
    dvdLED.clear();
    dvdLED.print(-1.2345678, 4);
    dvdLED.setLED(z++);
    delay(1000);
}
/* sequence of LEDs:
   порядок светодиодов:
    LED_SE0 0x00
    LED_SE1 0x01
    LED_SE2 0x02
    LED_SE3 0x03
    LED_SE4 0x04
    LED_SE5 0x05
    LED_SE6 0x06
    LED_SE7 0x07
    LED_DVD 0x08
    LED_VCD 0x09
    LED_MP3 0x0A
    LED_PLY 0x0B
    LED_PAU 0x0C
    LED_PBC 0x0D
    LED_RET 0x0E
    LED_DTS 0x0F
    LED_DDD 0x10
    LED_CL1 0x11
    LED_CL2 0x12
*/

