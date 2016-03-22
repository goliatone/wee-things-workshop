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

## node-esp cli tool

![node-esp](https://raw.githubusercontent.com/goliatone/wee-things-workshop/master/images/esp-tool-001.png?a)


## Lua programming language
 <code data-gist-id="558e5f9edb57ec8f65e8"></code>

# Let's get started

## Setup (hardware)

* NodeMCU dev board

![nodemcu](https://arduining.files.wordpress.com/2015/08/nodemcudevkit_v1-0_io.jpg)

## Setup (hardware)

* Micro USB cable
![microusb](https://raw.githubusercontent.com/goliatone/wee-things-workshop/master/images/microusb-cable-001.jpg)

## Setup (software)
* Drivers
* node-esp
* Firmware

Clone repo:
```
$ git clone git@github.com:goliatone/wee-things-workshop.git
```
# Project Directory

## Project Directory

![bootstrap](https://raw.githubusercontent.com/goliatone/wee-things-workshop/master/images/bootstrap-001.png?u)

# Drivers
<h3>Requires computer restart :(</h3>

## Drivers
![drives](https://raw.githubusercontent.com/goliatone/wee-things-workshop/master/images/drivers-siliconlabs-001.png)

# node-esp

<h3>Communication with NodeMCU</h3>

## node-esp

Install:

```
$ npm i -g node-esp
```

Need SiLabs drivers installed:
```
$ esp port list
```

Set port name:
```
$ esp port set /dev/cu.SLAB_USBtoUART
```

## node-esp

![nodemcu](https://raw.githubusercontent.com/goliatone/wee-things-workshop/master/images/esp-tool-002.png)

# Flashing NodeMCU
<h3>Loading NodeMCU firmware</h3>

## Flashing NodeMCU
Hold down the board's **FLASH** button and press the **RST** button at the same time.

From bin directory:
```
$ esp flash nodemcu_integer_0.9.6-dev_20150627.bin
```

## Flashing NodeMCU
![nodemcu](https://raw.githubusercontent.com/goliatone/wee-things-workshop/master/images/esp-tool-003.png)


# Hello, World!
<h3>NodeMCU programming in Lua</h3>

## Hello, World!

```lua
print("Hello, World!")
```


## Hello, World!

```lua
print("Hello, World!")
```
Send command using node-esp:
![nodemcu](https://raw.githubusercontent.com/goliatone/wee-things-workshop/master/images/esp-tool-004.png)


## Hello, World!

```lua
print("Hello, World!")
```
Create file and upload using node-esp:
![nodemcu](https://raw.githubusercontent.com/goliatone/wee-things-workshop/master/images/esp-tool-005.png)

## Hello, World!

![nodemcu](https://raw.githubusercontent.com/goliatone/wee-things-workshop/master/images/esp-tool-006.png)

<!--
SHOW IMAGES STEP BY STEP, LOAD & EXEC CODE
-->

# Hello, Blink!

## Hello, Blink!

<code data-gist-id="558e5f9edb57ec8f65e8"></code>

## Hello, Blink!
Create file in **code** directory, name it **hello_blink.lua**

```
$ esp file write hello_blink.lua
```

```
$ esp file list
```

Execute file:

```
$ esp file execute hello_blink.lua
```


# Hello, WiFi!

## Hello, WiFi!

<code data-gist-id="7ca042f7cc421fe84447"></code>


# WiFi, Blink!

## WiFi, Blink!

<code data-gist-id="001a3b147ddfee3e8451"></code>


# Thank you.
Emiliano Burgos

<a href="mailto:emiliano@wework.com">emiliano@wework.com</a>




<!-- samples
http://www.slideshare.net/JulinDavidDuque/javascript-robotics-a-nodebots-show
http://www.slideshare.net/coolsimo/how-to-structure-a-presentation-a-guide-with-examples
http://www.slideshare.net/msimonehouston/nodebots-50566451
-->
