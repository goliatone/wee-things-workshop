## Blink

If you are familiar with Arduino chances are you have followed through their version of the *hello world* tutorial. The code shows the simplest thing you can do with an Arduino to see physical output, a blinking light.

This is the NodeMCU equivalent. Note that we will not be using an external LED but the devkit's built in instead.

_NOTE:_ We learned how to load a script into the NodeMCU devkit in a previous [tutorial][hello-world], check this [introduction][intro] if you have not set your Mac environment.

---

### Source Code

First, the source code:

```lua
local pin = 4
local lighton = 0

gpio.mode(pin, gpio.OUTPUT)

-- time is in milliseconds, so 2 seconds.
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

### Create file and upload

Create a file in your **code** directory named `blink.lua` and type the source code.

To upload the file to the board we will issue the following commands in a terminal window. `cd` to the **code** directory and execute:

```
$ esp file write blink.lua
```

In the [hello-world][hello-world] tutorial we saw that we could use the `esp file execute` subcommand to run our program. Under the hood, `esp` is using Lua's [dofile][dofile] command. You can think of `dofile` as a kind of primitive operation to run chunks of Lua code.

To execute the `blink.lua` file we will use the `esp run` command, which sends a string- hopefully Lua code- to the NodeMCU board and executes it.

Will send send a Lua command to the board:

```
$ esp run 'dofile("blink.lua")'
```

### GPIO
As far as the code goes is fairly simple but it highlights some important concepts like interacting with peripherals using the `gpio` module.

**GPIO** stands for general-purpose input/output.

The first thing we do is to initialize **pin 4** as an **output** pin:

```
gpio.mode(pin, gpio.OUTPUT)
```

We then create a 2 second loop interval that will execute the passed in callback function.

```
tmr.alarm(1, 2000, 1, function()
```

Next we check the LED current state. If it's off we supply voltage to **pin 4**:

```
gpio.write(pin, gpio.HIGH)
```

Else we take **pin 4** back to 0 volts, turning the LED off.

```
gpio.write(pin, gpio.LOW)
```


[hello-world]: https://github.com/goliatone/wee-things-workshop/tree/master/tutorials/1-hello-world
[dofile]: http://www.lua.org/pil/8.html
[dofile-tutorial]: http://luatut.com/dofile.html

<!-- LINKS
http://www.ladyada.net/learn/arduino/lesson1.html
http://www.electroschematics.com/8930/arduino-blinking-led/
-->
