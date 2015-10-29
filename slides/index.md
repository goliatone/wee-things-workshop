# WeeThings

<h3>A workshop of little connected things.</h3>

Emiliano Burgos

<a href="http://wework.com">wework.com</a> | <a href="mailto:emiliano@wework.com">emiliano@wework.com</a>

# Github Repository

[WeeThings][wt]

https://github.com/goliatone/wee-things-workshop

[wt]:https://github.com/goliatone/wee-things-workshop

## WeeThings

<h4>Outline</h4>

## WeeThings

<h4>Outline</h4>
* Microcontrollers

## WeeThings

<h4>Outline</h4>
* Microcontrollers
* Setup

## WeeThings

<h4>Outline</h4>
* Microcontrollers
* Setup
    * Hardware

## WeeThings

<h4>Outline</h4>
* Microcontrollers
* Setup
    * Hardware
    * Software

## WeeThings

<h4>Outline</h4>
* Microcontrollers
* Setup
    * Hardware
    * Software
* Code

## WeeThings

<h4>Outline</h4>
* Microcontrollers
* Setup
    * Hardware
    * Software
* Code
    * Hello World

## WeeThings

<h4>Outline</h4>
* Microcontrollers
* Setup
    * Hardware
    * Software
* Code
    * Hello World
    * Hello Blink

## WeeThings

<h4>Outline</h4>
* Microcontrollers
* Setup
    * Hardware
    * Software
* Code
    * Hello World
    * Hello Blink

#### Requirements:

## WeeThings

<h4>Outline</h4>
* Microcontrollers
* Setup
    * Hardware
    * Software
* Code
    * Hello World
    * Hello Blink

#### Requirements:

- Basic programming knowledge

## WeeThings

<h4>Outline</h4>
* Microcontrollers
* Setup
    * Hardware
    * Software
* Code
    * Hello World
    * Hello Blink

#### Requirements:

- Basic programming knowledge
- Mac OS


# Microcontrollers

## Introduction to microcontrollers

_Wikipedia: [Microcontroller][microcontroller]_

>A microcontroller is a small computer on a single integrated circuit containing a processor core, memory, and programmable input/output peripherals.

[microcontroller]:https://en.wikipedia.org/wiki/Microcontroller

## Introduction to microcontrollers
_Arduino Uno image courtesy of Fritzing_
![nodemcu](https://raw.githubusercontent.com/goliatone/wee-things-workshop/master/images/microcontroller-001.png)


## Introduction to microcontrollers

<h4>ESP8266</h4>
![nodemcu](https://raw.githubusercontent.com/goliatone/wee-things-workshop/master/images/esp8266-001.png)

# Setup

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

## Setup (hardware)
* NodeMCU dev board
* Micro USB cable

## Setup (software)
* Drivers
* Firmware
* esptool
* ESPLorer

<!--
Everybody should make a directory in the same place, and cd.
-->

Bootstrap script:
```
$ curl -SLs https://goo.gl/3N7lDw | bash
```

## Setup (software)

![nodemcu](https://raw.githubusercontent.com/goliatone/wee-things-workshop/master/images/bootstrap-001.png)


## Setup (software)

![nodemcu](https://raw.githubusercontent.com/goliatone/wee-things-workshop/master/images/bootstrap-002.png)

## Setup (software)

![nodemcu](https://raw.githubusercontent.com/goliatone/wee-things-workshop/master/images/bootstrap-003.png)

# IDE
<!--
TODO: bootstrap should check for Java
make a slide of bootstrap result, cd ~/Desktop, mkdir wee-things, execute curl
and then take screenshot
-->
Commands to install
Command to run (image of cli and command)
Image of IDE open

# Hello World

## Hello World

```lua
print("Hello World!")
```

<!--
SHOW IMAGES STEP BY STEP, LOAD & EXEC CODE
-->

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
