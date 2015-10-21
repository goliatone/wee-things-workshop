## Blink

If you are familiar with Arduino chances are you have followed through their version of the *hello world* tutorial. The code shows the simplest thing you can do with an Arduino to see physical output, a blinking light.

This is the NodeMCU equivalent. Note that we will not be using an external LED but the devkit's built in instead.

_NOTE:_ We learned how to load a script into the NodeMCU devkit using ESPlorer in a previous [tutorial][hello-world], check this [introduction][intro] if you need to set up your Mac environment.


### Source Code

As far as the code goes is fairly simple but it highlights some important concepts.


Here's the code:

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

### Crashes and Bricks

If the `init.lua` file crashes, the NodeMCU board will restart, calling `init.lua` on boot entering a never ending loop. While testing the best practice is to use a different file to hold our code, in our case will name it `hello-world.lua`.

You can load and execute a script from your `init.lua` with the following directive:

```
dofile('hello-world.lua')
```


### WatchDog

The NodeMCU SDK employs an event-driven for programming at the application level. This event-driven approach is very different from the procedural paradigm you will see in most Lua programs or Arduino sketches.

Arduino sketches have a main loop where you place your code. It's also common in practice in Arduino sketches to use `delays`.

NodeMCU is single threaded and the ESP8266 has a [WatchDog][watchdog] timer. Tight loops trigger the watchdog timer which in turn restarts the firmware.

The best way to deal with this is by using the built in event system which is similar in nature to `nodejs`.


http://blog.nicolasc.eu/esp8266-premiere-partie-generalites/
http://blog.nicolasc.eu/esp8266-seconde-partie-le-mode-standalone/

[intro]: https://github.com/goliatone/esp8266-intro/blob/master
[hello-world]: https://github.com/goliatone/esp8266-intro/blob/master/tutorials/hello-world
[watchdog]: https://en.wikipedia.org/wiki/Watchdog_timer

<!-- LINKS
http://www.ladyada.net/learn/arduino/lesson1.html
http://www.electroschematics.com/8930/arduino-blinking-led
https://primalcortex.wordpress.com/2014/12/30/esp8266-nodemcu-and-lua-language-and-some-arduino-issues/
-->
