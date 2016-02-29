## WeeThings

An introduction to the [ESP8266][esp8266-wiki] microcontroller, a $4 WiFi module with an ARM processor, running the NodeMCU firmware, programmed in the [Lua][lua] programming language.

This little thing is great because:
 - it's cheap: $4, compared to $24 for the more popular Arduino
 - it comes with WiFi: if you were to get an Arduino, you'd _also_ have to get a WiFi module, possibly even an ESP8266!

With it, we can stream data from sensors, control appliances, build armies of robots...all over WiFi...all for $4.

![wee](https://raw.githubusercontent.com/goliatone/wee-things-workshop/master/images/weethings_green.png)
<br/>
(_[Logo][logo-dribbble] by Tracy Loi_)

### TOC

- [Prerequisites](#prerequisites)
- [Materials](#materials)
- [Quick Set Up](#quick-set-up)
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
- some basic programming knowledge
- you know how to open a **terminal**, execute scripts and type in a commands
- you can find your way around **Github**
- [Node.js][nodejs-org] installed in your machine

We've tested this tutorial on **MacOS**. It's possible to do with Windows, but there might be subtle differences when it comes to flashing the board and using the tools.

### Materials
The list of materials is intentionally short; we can get up and running pretty fast.

Hardware:
* [NodeMCU dev board][amazon-esp]
* [Micro USB cable][amazon-usb]

Software:
* [SiLabs Drivers][silabs-drivers] Used to communicate with the devkit
* [node-esp][node-esp] Command line interface to program the devkit. **TODO: Update package name**

Binaries:
* [NodeMCU firmware][esp-binaries] Latest release of the NodeMCU firmware

---
### Quick Set Up

The quick setup consists of 7 steps.
Clone this repo or download the zip archive. The following steps are relative to the projects main directory.

1. Install the [SiLabs Drivers](#silabs-drivers): The image is located in the `drivers` folder. Double click to start the installation process. **THIS WILL REQUIRE YOU TO RESTART YOUR COMPUTER AFTER INSTALLING THE DRIVER**

2. Ensure you have [Node.js][nodejs] installed. It is recommended that you use a node version manager tool like [nvm][nvm]

3. Install `node-esp`: `npm i -g node-esp`.

4. Connect the board to your computer.

5. Prep the board to flash the [NodeMCU firmware](#nodemcu-firmware):
    * From terminal, `cd` into **bin**.
    * Press the board's **FLASH** button and press the **RST** button at the same time. You should see an LED blink on the board.

6. Flash the board: run `esp flash nodemcu_integer_0.9.6-dev_20150627.bin`

7. **Unplug the USB cable** and **plug it** again.

Woohoo!! Now we are ready to start coding.

---
### Set up

#### SiLabs Drivers

_NOTE: This requires your computer to restart, save your work._

From the SiLabs driver [download page][silabs-drivers]:

>The CP210x USB to UART Bridge Virtual COM Port (VCP) drivers are required for device operation as a Virtual COM Port to facilitate host communication with CP210x products.

In order for your computer to communicate with the devkit you need to have installed special drivers. You can find the download [link here][silabs-drivers]. **[The bash script already downloaded the image file into your bin folder so open it up and follow the install instructions.]** TODO: DO WE NEED THE BASH SCRIPT? SHOULD THE DRIVER BE IN THE REPO?

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

If you are using a Mac:

```
$ esp port set /dev/cu.SLAB_USBtoUART
```

#### NodeMCU firmware
You can find the latest NodeMCU firmware at their github repository, in the release page following this [link][esp-binaries].

The ESP8266 chip comes loaded with an AT command set, and it's meant to be used by an external controller like an Arduino driving the chip over serial.

#### Flashing the NodeMCU
In this step, we are going to flash our devkit with the NodeMCU binaries downloaded before so we can start loading programs to the board. It sounds intimidating, but it's quite simple actually.

We already downloaded the NodeMCU [firmware][firmware], installed the SiLabs drivers, and have **esp** installed.

Connect the board to the computer using the USB cable.

From the project's main directory, open terminal and `cd` to the **bin** directory where the **nodemcu_float_0.9.6-dev_20150704.bin** file is located.

We need to put the board in flash mode. To do so hold down the board's **FLASH** button and press the **RST** button at the same time. You should see an LED blink on the board.

From terminal, `cd` into your project's **bin** directory. Then
type the following command in terminal and press enter:

```
esp flash nodemcu_integer_0.9.6-dev_20150627.bin
```
The script should provide some feedback in the terminal window while is executing.

```
Connecting...
Erasing flash...
Wrote 400384 bytes at 0x00000000 in 38.5 seconds (83.1 kbit/s)...

Leaving...
```

Now **unplug the USB cable** and **plug it** again.

Congratulations, we now have a board properly flashed and we are ready to start uploading code.

<!--
#### Tutorials
To follow along the tutorials when you have to create a file with source code, place your files inside the [code][code-dir] directory. In the tutorials we will assume that you did so and all paths will be relative to the `code` directory.

You can use any text editor or IDE to create and edit files. I recommend using [Atom][atom] since it supports Lua syntax and you can lint your Lua code which will help you catch some errors before you execute your code on the board.

We will be using the [esp cli tool][node-esp] to manage the boards file system and send commands to it as well to see debug information in our terminal console.

A lot of our workflow happens in a terminal environment.

-->

Now you can proceed with the next tutorials:
* [Hello World][hello-world]
* [Hello Blink][hello-blink]
* [Hello WiFi][hello-wifi]
* [WiFi Blink][hello-blink]
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

If you are new to programming, there is an online tutorial following the *Learn the Hard Way* method that uses Lua. [Here][learn-lua]

Lua has a package manager, [LuaRocks][luarocks]. A package manager is a set of tools that help you install, upgrade, configure, and manage software packages, or modules, and their dependencies. From the LuaRocks website:
>LuaRocks allows you to create and install Lua modules as self-contained packages called rocks.


If you are using Atom you can install the following plugins:
* [Lua support][language-lua]
* [Lua linter][lua-linter]
* [Lua globals][atom-lua-globals]

Sublime:
* [SublimeLinter-lua][SublimeLinter-lua]


To install [Lua JIT][luajit] compiler on Mac using `brew`:

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
[nvm]: https://github.com/creationix/nvm
[nodejs-download]: https://nodejs.org/en/download
[node-esp]: https://www.npmjs.com/package/node-esp


[atom-lua-globals]: https://atom.io/packages/linter-lua-findglobals
[atom]: https://atom.io


[dofile]: http://www.lua.org/pil/8.html
[dofile-tutorial]: http://luatut.com/dofile.html
