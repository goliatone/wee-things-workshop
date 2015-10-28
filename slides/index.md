# WeeThings

<h3>A workshop of little connected things.</h3>

Emiliano Burgos

<a href="http://wework.com">wework.com</a> | <a href="mailto:emiliano@wework.com">emiliano@wework.com</a>

## WeeThings

* Microcontrollers
* The Basics
    * Hardware
    * Software
* Best practices
* Profit

Basic programming knowledge

Mac OS


# Microcontrollers

## Introduction to microcontrollers

_Wikipedia: [Microcontroller][microcontroller]_

>A microcontroller is a small computer on a single integrated circuit containing a processor core, memory, and programmable input/output peripherals.


[microcontroller]:https://en.wikipedia.org/wiki/Microcontroller

## Introduction to microcontrollers

* ESP8266


# The basics

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



## The Setup (software)
* Drivers
* Firmware
* esptool
* ESPLorer

Bootstrap script:
```
$ curl -SLs https://goo.gl/3N7lDw | bash
```

# IDE

# Hello World

## Hello World

```lua
print("Hello World!")
```

# Hello Blink!

## Hello Blink!

```lua
local pin = 4
local lighton = 0

gpio.mode(pin, gpio.OUTPUT)

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


# Thank you.
Emiliano Burgos

<a href="mailto:emiliano@wework.com">emiliano@wework.com</a>




<!-- samples
http://www.slideshare.net/JulinDavidDuque/javascript-robotics-a-nodebots-show
http://www.slideshare.net/coolsimo/how-to-structure-a-presentation-a-guide-with-examples
http://www.slideshare.net/msimonehouston/nodebots-50566451
-->
