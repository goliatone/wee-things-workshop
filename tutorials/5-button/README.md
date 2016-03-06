## Hello, Button!

In this tutorial we will use our NodeMCU board to react to a physical button.

We will combine this tutorial with Hello Blink and manage the state of an onboard LED. We will use a [Breadboard][breadboard] and a simple Button switch.

We will also introduce how to write modules in Lua.

### Wiring the Button
We use physical GPIO pins to interface with the things through code. We can listen for a button press as input, and use an LED as our output. To do so NodeMCU provides the [gpio][wiki-gpio] module.


Wiring the circuit is the next step. We will be two female/male extension jumper wires. Look for  
![wee](https://raw.githubusercontent.com/goliatone/wee-things-workshop/master/images/5-button_bb.jpg)

### App module

Is good practice to create self contained modules, and expose an object with an interface to interact with.

In Lua we can do this using a table, akin to an Object in JavaScript. We can attach functions to a table.

```lua
local App = {}

function App.start()

end

App.start();
```

Now we will add the code we need to run our program inside the `App.start` function.

```lua
local App = {}

App.count = 0

function onpindown(level)
    print("Pin down", level)
end

function App.start()
    gpio.mode(2, gpio.INPUT, gpio.PULLUP)
    gpio.trig(2, 'both', onpindown)
end

App.start();
```




We use the `gpio` module to initialize pin #2 to act as input since we want to know about any button press.

```lua
gpio.mode(2, gpio.INPUT, gpio.PULLUP)
```

Any pin has three possible states: ON, OFF, and FLOATING. If we don't have anything connected to a pin and we try to read from it, then we will get random ON/OFF values, and we say it's floating.

You can read more about pull-up resistors [here][pullup].

We use the third argument to `gpio.PULLUP` to drive the state of pin #2 to a known state/value. Then, when the button is pressed the input pin is pulled down. When the button is released the pin is pulled up.

Next, we use `gpio.trig` to register a callback function that will run when there is a change in the pin value.

```lua
gpio.trig(2, 'both', onpindown)
```

[pullup]:https://learn.sparkfun.com/tutorials/pull-up-resistors
[breadboard]: https://learn.adafruit.com/lesson-0-getting-started/breadboard
[wiki-gpio]: http://nodemcu.readthedocs.org/en/dev/en/modules/gpio/
