# WeeThings

A tutorial of little connected things.

# Microcontrollers

## Introduction to microcontrollers

* Using the ESP8266

## Introduction to microcontrollers

* Using the ESP8266
* Basic programming knowledge

## The basics

## NodeMCU
![nodemcu](https://raw.githubusercontent.com/goliatone/wee-things-workshop/master/images/nodemcu-001.jpg)

## ESPlorer IDE

![nodemcu](https://raw.githubusercontent.com/goliatone/wee-things-workshop/master/images/esplorer-001.png)

## Lua programming language

```lua
local pin = 4
local lighton = 0

gpio.mode(pin, gpio.OUTPUT)

-- time is in milliseconds
tmr.alarm(1, 2000, 1, function()
    if lighton == 0 then
        lighton = 1
        gpio.write(pin, gpio.HIGH)
    else
        lighton = 0
        gpio.write(pin, gpio.LOW)
    end
end)
```

# Let's get started

## The Setup (hardware)
* NodeMCU dev board
* Micro USB cable



### The Setup (software)
* Drivers
* Firmware
* esptool
* ESPLorer

```
$ curl -SLs https://goo.gl/3N7lDw | bash
```

# IDE



# Thank you.
Emiliano Burgos
<a href="mailto:emiliano@wework.com">emiliano@wework.com</a>
