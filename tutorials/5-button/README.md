## Hello, Button!

In this tutorial we will use our NodeMCU board to react to a physical button.

We will combine this tutorial with Hello Blink and manage the state of an onboard LED. We will use a [Breadboard][breadboard] and a simple Button switch.

We will also introduce how to write modules in Lua.

### Wiring the Button

The LED will act as our output, and the switch Button as our input.


![wee](https://raw.githubusercontent.com/goliatone/wee-things-workshop/master/images/5-button_bb.jpg)



### App module

Is good practice to create self contained modules, and expose an object with an interface to interact with.

In Lua we can do this using a table, akin to an Object in JavaScript. We can attach functions to a table.

[breadboard]: https://learn.adafruit.com/lesson-0-getting-started/breadboard
