## Blink

If you are familiar with Arduino chances are you have followed through their version of the *hello world* tutorial. The code shows the simplest thing you can do with an Arduino to see physical output, a blinking light.

This is the NodeMCU equivalent. Note that we will not be using an external LED but the devkit's built in instead.

_NOTE:_ We learned how to load a script into the NodeMCU devkit using ESPlorer in a previous [tutorial][hello-world]

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


[hello-world]: https://github.com/goliatone/esp8266-intro/blog/master/code/hello-world/

<!-- LINKS
http://www.ladyada.net/learn/arduino/lesson1.html
http://www.electroschematics.com/8930/arduino-blinking-led/
-->
