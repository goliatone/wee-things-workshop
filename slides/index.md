# WeeThings

<h3>A workshop of little connected things.</h3>

Emiliano Burgos

<a href="http://wework.com">wework.com</a> | <a href="mailto:emiliano@wework.com">emiliano@wework.com</a>

# Github Repository

[WeeThings][wt]

https://github.com/goliatone/wee-things-workshop

[wt]:https://github.com/goliatone/wee-things-workshop

## Goals

* Familiarize ourselves with the NodeMCU dev board.

## Goals

* Familiarize ourselves with the NodeMCU dev board.
* Setup a work environment.

## Goals

* Familiarize ourselves with the NodeMCU dev board.
* Setup a work environment.
* Be able to load and execute code.

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
    * Hello WiFi

## WeeThings

<h4>Outline</h4>
* Microcontrollers
* Setup
    * Hardware
    * Software
* Code
    * Hello World
    * Hello Blink
    * Hello WiFi
    * WiFi Blink!

## WeeThings

<h4>Outline</h4>
* Microcontrollers
* Setup
    * Hardware
    * Software
* Code
    * Hello World
    * Hello Blink
    * Hello WiFi
    * WiFi Blink!

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
    * Hello WiFi
    * WiFi Blink!

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
    * Hello WiFi
    * WiFi Blink!

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
![ESP8266](https://raw.githubusercontent.com/goliatone/wee-things-workshop/master/images/esp8266-001.png)

## Introduction to microcontrollers

<h4>NodeMCU</h4>
![nodemcu](https://raw.githubusercontent.com/goliatone/wee-things-workshop/master/images/nodemcu-001.jpg)

# Setup

## NodeMCU
![nodemcu](https://raw.githubusercontent.com/goliatone/wee-things-workshop/master/images/nodemcu-001.jpg)

## ESPlorer IDE

![esplorer](https://raw.githubusercontent.com/goliatone/wee-things-workshop/master/images/esplorer-001.png)

## Lua programming language
 <code data-gist-id="558e5f9edb57ec8f65e8"></code>

# Let's get started

## Setup (hardware)

* NodeMCU dev board

![nodemcu](https://raw.githubusercontent.com/goliatone/wee-things-workshop/master/images/nodemcu-001.jpg)

## Setup (hardware)

* Micro USB cable
![microusb](https://raw.githubusercontent.com/goliatone/wee-things-workshop/master/images/microusb-cable-001.jpg)

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

![bootstrap](https://raw.githubusercontent.com/goliatone/wee-things-workshop/master/images/bootstrap-001.png)


## Setup (software)

![bootstrap](https://raw.githubusercontent.com/goliatone/wee-things-workshop/master/images/bootstrap-002.png)

## Setup (software)

![bootstrap](https://raw.githubusercontent.com/goliatone/wee-things-workshop/master/images/bootstrap-003.png)

# IDE
<h3>Communication with NodeMCU</h3>

<!--
TODO: bootstrap should check for Java
make a slide of bootstrap result, cd ~/Desktop, mkdir wee-things, execute curl
and then take screenshot
-->

## IDE
![nodemcu](https://raw.githubusercontent.com/goliatone/wee-things-workshop/master/images/esplorer-ide-001.png)

## IDE
![nodemcu](https://raw.githubusercontent.com/goliatone/wee-things-workshop/master/images/esplorer-ide-002.png)

## IDE
![nodemcu](https://raw.githubusercontent.com/goliatone/wee-things-workshop/master/images/esplorer-ide-003.png)

# Drivers
<h3>Requires computer restart :(</h3>

## Drivers
![drives](https://raw.githubusercontent.com/goliatone/wee-things-workshop/master/images/drivers-siliconlabs-001.png)

# esptool
<h3>Loading firmware to NodeMCU</h3>

## esptool

```
$ cd ~/Desktop/wee-things/wee-things-workshop/bin/esptool
```

## esptool

```
$ esptool.py --port=/dev/cu.SLAB_USBtoUART write_flash \
 -fm=dio -fs=32m -ff=40m 0x00000 \
 ../nodemcu_float_0.9.6-dev_20150704.bin
```

## esptool

Unplug USB cable.

```
Connecting...
Erasing flash...
Wrote 400384 bytes at 0x00000000 in 38.5 seconds (83.1 kbit/s)...

Leaving...
```

## Check
![check](https://raw.githubusercontent.com/goliatone/wee-things-workshop/master/images/esplorer-check-001.png)


# Hello World

## Hello World

```lua
print("Hello World!")
```


## Hello World

Send command through IDE.

```lua
print("Hello World!")
```

![esplorer](https://raw.githubusercontent.com/goliatone/wee-things-workshop/master/images/esplorer-001.png)


## Hello World

Create file and upload through IDE.

```lua
print("Hello World!")
```

![esplorer](https://raw.githubusercontent.com/goliatone/wee-things-workshop/master/images/esplorer-001.png)



<!--
SHOW IMAGES STEP BY STEP, LOAD & EXEC CODE
-->

# Hello Blink!

## Hello Blink!

<code data-gist-id="558e5f9edb57ec8f65e8"></code>


# Hello WiFi!

## Hello WiFi!

<code data-gist-id="7ca042f7cc421fe84447"></code>


# WiFi Blink!

## WiFi Blink!

<code data-gist-id="001a3b147ddfee3e8451"></code>


# Thank you.
Emiliano Burgos

<a href="mailto:emiliano@wework.com">emiliano@wework.com</a>




<!-- samples
http://www.slideshare.net/JulinDavidDuque/javascript-robotics-a-nodebots-show
http://www.slideshare.net/coolsimo/how-to-structure-a-presentation-a-guide-with-examples
http://www.slideshare.net/msimonehouston/nodebots-50566451
-->
