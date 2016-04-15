## Sleepy Node

In this tutorial we will learn how to configure our NodeMCU board so that it goes into deep-sleep mode. We will also read temperature and humidity values using a [DHT11][dht11] sensor.

We will be using the `dht` module. You can check the full API in the NodeMCU [wiki][dht-module].

### Intro
If you have a[ NodeMCU custom build][custom-build], ensure the `dht` module was selected. Otherwise you will need a new build.


[dht11]:http://www.amazon.com/Qunqi-Temperature-Humidity-Arduino-Raspberry/dp/B014PCKTF4
[dht-module]:http://nodemcu.readthedocs.org/en/dev/en/modules/dht
[custom-build]:http://nodemcu-build.com/
