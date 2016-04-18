## PIR Movement Detector

In this tutorial we will build an IoT motion sensor.

To build our circuit and power the PIR sensor we will need to add a voltage regulator.


### Intro

The ESP8266 board can provide 3.3V but most PIR sensors run on 5V-16V, if we try to power the PIR directly from the board we would get useless readings.

There are different ways to address this issue. One is to hack the PIR sensor, we can bypass an onboard regulator that brings the input voltage down to 3V since internally many PIR sensors work at 3V. This requires soldering/desoldering.

Another option and the one we will use here, is to add a step-up voltage regulator, which will transform our board's 3.3V to the 5V needed by the motion sensor.


Material list:
- PIR motion sensor [adafruit][pir-ada]
- 5v Step-up Voltage regulator [U1V11F5][pololu]

### Wiring Diagram

![pir-step-up](https://raw.githubusercontent.com/goliatone/wee-things-workshop/master/images/pir-step-up-001.png)

### Source Code


[pir-ada]:https://www.adafruit.com/products/189
[pololu]:https://www.pololu.com/product/2562
