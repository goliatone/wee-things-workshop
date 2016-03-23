# WeeThings

<h3>A workshop of little connected things.</h3>

Emiliano Burgos

<a href="http://wework.com">wework.com</a> | <a href="mailto:emiliano@wework.com">emiliano@wework.com</a>

???
Please, everyone, introduce yourselves.
Also, what's our level?
Ok, we have a gitter set up for the workshop.

# Gitter IM

[wee-things-workshop][wt]

https://gitter.im/goliatone/wee-things-workshop

[wt]:https://gitter.im/goliatone/wee-things-workshop

???
Using this we can send code snippets and links around. It's pretty helpful.

# Github Repository

[WeeThings][wt]

https://github.com/goliatone/wee-things-workshop

[wt]:https://github.com/goliatone/wee-things-workshop
???

## Goals
<span></span>
???
This workshop has 3 goals.

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
    * Hello, World!

## WeeThings

<h4>Outline</h4>
* Microcontrollers
* Setup
    * Hardware
    * Software
* Code
    * Hello, World!
    * Hello, Blink!

## WeeThings

<h4>Outline</h4>
* Microcontrollers
* Setup
    * Hardware
    * Software
* Code
    * Hello, World!
    * Hello, Blink!
    * Hello, WiFi!

## WeeThings

<h4>Outline</h4>
* Microcontrollers
* Setup
    * Hardware
    * Software
* Code
    * Hello, World!
    * Hello, Blink!
    * Hello, WiFi!
    * WiFi, Blink!

## WeeThings

<h4>Outline</h4>
* Microcontrollers
* Setup
    * Hardware
    * Software
* Code
    * Hello, World!
    * Hello, Blink!
    * Hello, WiFi!
    * WiFi, Blink!

#### Requirements:

## WeeThings

<h4>Outline</h4>
* Microcontrollers
* Setup
    * Hardware
    * Software
* Code
    * Hello, World!
    * Hello, Blink!
    * Hello, WiFi!
    * WiFi, Blink!

#### Requirements:

- Basic programming knowledge
???
We will be using Terminal a lot. The ESP8266 has a C SDK, software development kit. We are going to install different firmware- think of it as installing a different OS on a computer.

## WeeThings

<h4>Outline</h4>
* Microcontrollers
* Setup
    * Hardware
    * Software
* Code
    * Hello, World!
    * Hello, Blink!
    * Hello, WiFi!
    * WiFi, Blink!

#### Requirements:

- Basic programming knowledge
- Mac OS
???
More than anything Mac OS is a requirement right now because is the only platform we've used so far. In theory, it should work on a Windows machine.

## WeeThings

<h4>Outline</h4>
* Microcontrollers
* Setup
    * Hardware
    * Software
* Code
    * Hello, World!
    * Hello, Blink!
    * Hello, WiFi!
    * WiFi, Blink!

#### Requirements:

- Basic programming knowledge
- Mac OS

**NOTE**: Drivers require computer restart
???
SO! Probably we want to install the drivers first?

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
???
Let's make sure that we all have the required hardware.

## Setup (hardware)

* NodeMCU dev board

![nodemcu](https://raw.githubusercontent.com/goliatone/wee-things-workshop/master/images/nodemcu-001.jpg)

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
???


# Project Directory

## Project Directory

![bootstrap](https://raw.githubusercontent.com/goliatone/wee-things-workshop/master/images/project-directory-001.png)
???
Open the directory and look at the contents and structure.
From now on, we will be forking from this directory and the next slides will make reference to directories like **bin** or **code**.

# Drivers
<h3>Requires computer restart :(</h3>

## Drivers

* Project directory, inside **bin** folder.
* https://goo.gl/SS1YoE

## Drivers
![drives](https://raw.githubusercontent.com/goliatone/wee-things-workshop/master/images/drivers-siliconlabs-001.png)

# node-esp

<h3>Communication with NodeMCU</h3>

???
The previous version of this workshop used ESPLorer, which is a Java based IDE. What we learnt pretty quickly was that we spent most of the time figuring out how to install Java, or update Java on each of the attendees machines. The rest of the time was about how to use the IDE... it did not make much sense.

So, I did what any software Engineer would do. I decided to build a better a tool...
node-esp is a terminal application that let's you interact with a NodeMCU board. You can upload files, execute them, output debug information to the screen.

---

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

???
In this step, we are going to flash our devkit with the NodeMCU binaries downloaded before so we can start loading programs to the board. It sounds intimidating, but it's quite simple actually, think of it as upgrading the operating system on a computer.

---
## Flashing NodeMCU
Hold down the board's **FLASH** button and press the **RST** button at the same time.

From bin directory:
```
$ esp flash nodemcu_integer_0.9.6-dev_20150704.bin
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

**https://goo.gl/Kbw7Ep**

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

**https://goo.gl/7TftH2**

<code data-gist-id="7ca042f7cc421fe84447"></code>

## Hello, WiFi!
Create file in **code** directory, name it **hello_wifi.lua**

```
$ esp file write hello_wifi.lua
```

```
$ esp file list
```

## Hello, WiFi!

```
$ esp file execute hello_wifi.lua
```

```
Wifi mode: 	2
MAC: 	18:fe:34:f1:fa:df

Created WiFi network:
Network Name
- SSID: 	WEE_THINGS_15858399
Security: WPA/WPA 2 Personal
- PWD: 	weething

IP: 	192.168.4.1	255.255.255.0	192.168.4.1
```

## Hello, WiFi!
Connect to Access Point:
![nodemcu](https://raw.githubusercontent.com/goliatone/wee-things-workshop/master/images/hello-wifi-001.png)


# WiFi, Blink!

## WiFi, Blink!

**https://goo.gl/KwAFu4**

<code data-gist-id="001a3b147ddfee3e8451"></code>

## WiFi, Blink!
Create file in **code** directory, name it **wifi_blink.lua**

```
$ esp file write wifi_blink.lua
```

```
$ esp file list
```

## WiFi, Blink!

```
$ esp file execute wifi_blink.lua
```

```
Wifi mode: 	2
MAC: 	18:fe:34:f1:fa:df

Created WiFi network:
Network Name
- SSID: 	WEE_THINGS_15858399
Security: WPA/WPA 2 Personal
- PWD: 	weething

IP: 	192.168.4.1	255.255.255.0	192.168.4.1
```

## WiFi, Blink!
Browse to:

```
http://192.168.4.1/
```

## WiFi, Blink!
![nodemcu](https://raw.githubusercontent.com/goliatone/wee-things-workshop/master/images/wifi-blink-001.png)


# Thank you.
Emiliano Burgos

<a href="mailto:emiliano@wework.com">emiliano@wework.com</a>




<!-- samples
http://www.slideshare.net/JulinDavidDuque/javascript-robotics-a-nodebots-show
http://www.slideshare.net/coolsimo/how-to-structure-a-presentation-a-guide-with-examples
http://www.slideshare.net/msimonehouston/nodebots-50566451
-->
