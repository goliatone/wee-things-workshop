## WeeThings

An introduction to the [ESP8266][esp8266-wiki], how to program it, and tools to help us do so.

[![Gitter](https://badges.gitter.im/goliatone/wee-things-workshop.svg)](https://gitter.im/goliatone/wee-things-workshop?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)

The ESP8266 microcontroller is a WiFi module with an [ARM][arm] processor, we will use the [NodeMCU][nodemcu] firmware and will program in the [Lua][lua] programming language.

This little thing is great because:
 - it's cheap: $4, compared to $24 for the more popular Arduino
 - it comes with WiFi: Arduino need separate modules to be "connected", possibly even an ESP8266!

With the ESP8266, we can stream data from sensors, control appliances, build armies of robots...all over WiFi...

![wee](https://raw.githubusercontent.com/goliatone/wee-things-workshop/master/images/weethings_green.png)
<br/>
(_[Logo][logo-dribbble] by Tracy Loi_)

### Table Of Contents

- [Prerequisites](#prerequisites)
- [Materials](#materials)
- [Quick Start](#quick-start)
- [Set up](#set-up)
    - [SiLabs Drivers](#silabs-drivers)
    - [Node.js](#nodejs)
    - [NodeMCU firmware](#nodemcu-firmware)
    - [Flashing the NodeMCU](#flashing-the-nodemcu)
- [Colophon](#colophon)
- [Resources](#resources)
    - [ESP8266](#esp8266)
    - [Lua](#lua)

---
### Prerequisites

This tutorial expects:
- you have some basic programming knowledge
- you know [how to open a **terminal**][how-to-terminal], execute scripts and type in a commands
- you can find your way around Github
- you have [Node.js][nodejs-org] [installed][node-install] in your machine

We've tested this tutorial on MacOS. It's possible to do with Windows, but there might be subtle differences when it comes to flashing the board and using the tools.

### Materials
The list of materials is intentionally short; we can get up and running pretty fast.

Hardware:
* [NodeMCU dev board][amazon-esp]
* [Micro USB cable][amazon-usb]

Software:
* [SiLabs Drivers][silabs-drivers] Used to communicate with the devkit
* [node-esp][node-esp] Command line interface to program the devkit.
Binaries:
* [NodeMCU firmware][esp-binaries] Latest release of the NodeMCU firmware

---
### Quick Start

The quick setup consists of 8 steps. [Below](#set-up) you can find a more detailed set of instructions.

Clone this repo or download the zip archive. The following steps are relative to the projects main directory.

1. Install the [SiLabs Drivers](#silabs-drivers): The disk image ,with a dmg extension, is located in the `drivers` folder. Double click to start the installation process. **THIS WILL REQUIRE YOU TO RESTART YOUR COMPUTER AFTER INSTALLING THE DRIVER**

2. Ensure you have [Node.js][nodejs-org] installed.

3. From terminal, use [npm][npm] to install node-esp: `npm i -g node-esp`.

4. [Set the node-esp port][esp-install]: `esp port set /dev/cu.SLAB_USBtoUART`

5. Connect the board to your computer.

6. Prep the board to flash the [NodeMCU firmware](#nodemcu-firmware):
    * From terminal, `cd` into **bin**.

7. Flash the board: from terminal run `esp flash nodemcu_integer_0.9.6-dev_20150704.bin`

8. **Unplug the USB cable** and **plug it** again.

Woohoo!! Now we are ready to start coding.

---
### Set up

#### SiLabs Drivers

_NOTE: This requires your computer to restart, save your work._

From the SiLabs driver [download page][silabs-drivers]:

>The CP210x USB to UART Bridge Virtual COM Port (VCP) drivers are required for device operation as a Virtual COM Port to facilitate host communication with CP210x products.

In order for your computer to communicate with the devkit you need to have installed special drivers. You can find the download [link here][silabs-drivers].

The ESP8266 runs a Lua interpreter and you can send in commands and read out results over serial.

#### Node.js
If you don't have **Node.js** installed in your computer, download the installer from [here][nodejs-download].

We will be using node's package manager, `npm`, to install our CLI tool.

Once you know you have `node` then `npm` should be available from terminal as well.

```
$ npm i -g node-esp
```

To ensure we the utility installed correctly, open a terminal window and type `esp --help`. It should display the `help` dialog.

The first time you use the `esp` tool you need to configure the port to talk to the NodeMCU board:

```
$ esp port set /dev/cu.SLAB_USBtoUART
```

#### NodeMCU firmware

You can find the latest NodeMCU firmware at their Github repository, in the release page following this [link][esp-binaries].

The ESP8266 chip comes loaded with an [AT command set][at-commands], and it's meant to be used by an external controller like an Arduino driving the chip over serial.

#### Flashing the NodeMCU
In this step, we are going to flash our devkit with the NodeMCU binaries downloaded before so we can start loading programs to the board. It sounds intimidating, but it's quite simple actually, think of it as upgrading the operating system on a computer.

We already downloaded the NodeMCU [firmware][firmware], installed the SiLabs drivers, and have **esp** installed.

Connect the board to the computer using the USB cable.

We need to put the board in flash mode. To do so hold down the board's **FLASH** button and press the **RST** button at the same time. You should see an LED blink on the board.

From terminal, `cd` into your project's **bin** directory. Then
type the following command in terminal and press enter:

```
esp flash nodemcu_integer_0.9.6-dev_20150704.bin
```
The script should provide some feedback in the terminal window while it is executing.

```
Connecting...
Erasing flash...
Wrote 400384 bytes at 0x00000000 in 38.5 seconds (83.1 kbit/s)...

Leaving...
```

Now **unplug the USB cable** and **plug it** again.

Congratulations, we now have a board properly setup and we are ready to start uploading code.

<!--
#### Tutorials
To follow along the tutorials when you have to create a file with source code, place your files inside the [code][code-dir] directory. In the tutorials we will assume that you did so and all paths will be relative to the `code` directory.

You can use any text editor or IDE to create and edit files. I recommend using [Atom][atom] since it supports Lua syntax and you can lint your Lua code which will help you catch some errors before you execute your code on the board.

We will be using the [esp cli tool][node-esp] to manage the boards file system and send commands to it as well to see debug information in our terminal console.

A lot of our workflow happens in a terminal environment.

-->

<!--
### More on ESP8266

The [ESP8266][espressif] is a microcontroller with 2.4 GHz WiFi capabilities supporting the WPA/WPA2 [protocols][wpa-protocols], general-purpose input/output (GPIO), Inter-Integrated Circuit (I2C), analog-to-digital conversion (ADC), Serial Peripheral Interface (SPI), and pulse-width modulation (PWM). The chip operates at 80Mhz, has a 64KB boot ROM, 64KB instruction RAM, and 96KB data RAM.
-->

---
### Colophon
And with this we conclude the boring setup process. We are ready to start coding and making things.

We will start by doing the mandatory [hello world][hello-world] tutorial which will teach us how to load code into a devkit board.

Next, we will do the classical [hello world of electronics][hello-blink] and get an LED blinking.

If you are not familiar with the Lua programming language you can always follow a quick intro tutorial. Check out the Lua links in the [Resources](#resources) section.

You should also check out NodeMCU's [API wiki page][nodemcu-wiki-api]. It covers succinctly all the different modules and their methods.

Now you can proceed with the next tutorials:
* [Hello World][hello-world]
* [Hello Blink][hello-blink]
* [Hello WiFi][hello-wifi]
* [WiFi Blink][hello-blink]

---
### Resources

#### ESP8266
* [ESP8266 forum][esp8266-forum]

#### NodeMCU
* [NodeMCU wiki][nodemcu-wiki]
* [The unoficial NodeMCU FAQ][nodemcu-faq]
* [MQTT on the NodeMCU][nodemcu-mqtt]
* [NodeMCU iot 1][nodemcu-iot-1]
* [NodeMCU iot 2][nodemcu-iot-1]

#### Lua
* [Cheatsheet][lua-cheatsheet]
* [Official site][lua]
* [Quick introduction][lua-intro]
* [Introductory tutorial][lua-tutorial]
* [Tutorials directory][lua-tutorials-directory]
    * [dofile][dofile]
    * [dofile tutorial][dofile-tutorial]

If you are new to programming, there is an online tutorial following the [Learn the Hard Way][learn-lua] method that uses Lua.

Lua has a package manager, [LuaRocks][luarocks]. A package manager is a set of tools that help you install, upgrade, configure, and manage software packages, or modules, and their dependencies. From the LuaRocks website:
>LuaRocks allows you to create and install Lua modules as self-contained packages called rocks.


If you are using Atom you can install the following plugins:
* [Lua support][language-lua]
* [Lua linter][lua-linter]
* [Lua globals][atom-lua-globals]

If you are using Sublime Text you can install the following plugins:
* [SublimeLinter-lua][SublimeLinter-lua]


Some of this plugins might require you to install [Lua JIT][luajit] compiler, on Mac use [brew][brew]:

```
brew install luajit --with-52compat
```

<!-- LINKS -->
[espressif]: http://espressif.com/en/products/esp8266/

[firmware]: https://github.com/nodemcu/nodemcu-firmware/releases
[nodemcu-wiki]: https://github.com/nodemcu/nodemcu-firmware/wiki
[nodemcu-wiki-api]:http://nodemcu.readthedocs.org/en/dev/
[amazon-usb]: http://www.amazon.com/AmazonBasics-Micro-USB-USB-Cable-Meters/dp/B00NH124VM/
[amazon-esp]: http://www.amazon.com/Eleduino-Version-Internet-ESP8266-Development/dp/B010O1G1ES/

[esp-binaries]: https://github.com/nodemcu/nodemcu-firmware/releases
[esp8266-forum]: http://www.esp8266.com
[esp8266-wiki]: https://en.wikipedia.org/wiki/ESP8266

[nodemcu-faq]: http://www.esp8266.com/wiki/doku.php?id=nodemcu-unofficial-faq
[silabs-drivers]: https://www.silabs.com/products/mcu/Pages/USBtoUARTBridgeVCPDrivers.aspx
[nodemcu-mqtt]: http://www.allaboutcircuits.com/projects/introduction-to-the-mqtt-protocol-on-nodemcu/


[lua]: http://www.lua.org
[lua-intro]: http://luatut.com
[lua-tutorial]: http://lua-users.org/wiki/LuaTutorial
[lua-tutorials-directory]: http://lua-users.org/wiki/TutorialDirectory
[lua-ide]: http://studio.zerobrane.com/download
[lua-cheatsheet]: http://thomaslauer.com/download/luarefv51.pdf
[language-lua]: https://atom.io/packages/language-lua
[lua-linter]: https://github.com/AtomLinter/linter-lua
[SublimeLinter-lua]: https://github.com/SublimeLinter/SublimeLinter-lua
[luarocks]: https://luarocks.org

[luajit]:http://luajit.org/install.html

[hello-world]: https://github.com/goliatone/wee-things-workshop/tree/master/tutorials/1-hello-world
[hello-blink]: https://github.com/goliatone/wee-things-workshop/tree/master/tutorials/2-hello-blink
[hello-wifi]: https://github.com/goliatone/wee-things-workshop/tree/master/tutorials/3-wifi-ap
[hello-blink]: https://github.com/goliatone/wee-things-workshop/tree/master/tutorials/4-hello-wifi-blink

[bin-directory]: https://github.com/goliatone/esp8266-intro
[wpa-protocols]: https://en.wikipedia.org/wiki/Wi-Fi_Protected_Access
[nodemcu-iot-1]: http://www.allaboutcircuits.com/projects/guts-of-the-iot-part-1-building-nodemcu-from-source-for-the-esp8266/
[nodemcu-iot-2]: http://www.allaboutcircuits.com/projects/how-to-make-an-interactive-tcp-server-nodemcu-on-the-esp8266/
[learn-lua]: http://www.phailed.me/2011/02/learn-lua-the-hard-way-1/

[logo-dribbble]: https://dribbble.com/shots/2352690-Hardware-Workshop

[nodejs-org]: https://nodejs.org/en
[nodejs-download]: https://nodejs.org/en/download
[node-esp]: https://www.npmjs.com/package/node-esp


[atom-lua-globals]: https://atom.io/packages/linter-lua-findglobals
[atom]: https://atom.io


[dofile]: http://www.lua.org/pil/8.html
[dofile-tutorial]: http://luatut.com/dofile.html
[arm]: https://en.wikipedia.org/wiki/ARM_architecture
[nodemcu]: http://www.nodemcu.com/index_en.html
[how-to-terminal]: http://www.coderanch.com/t/111327/Mac/open-terminal-window-mac
[node-install]: http://www.lynda.com/Node-js-tutorials/Installing-Node-js-Mac/417077/454428-4.html
[npm]:https://docs.npmjs.com/getting-started/what-is-npm
[nodemcu-diagram]:https://arduining.files.wordpress.com/2015/08/nodemcudevkit_v1-0_io.jpg
[at-commands]:https://en.wikipedia.org/wiki/Hayes_command_set
[brew]:http://brew.sh/
[esp-install]:https://github.com/goliatone/node-esp#install
