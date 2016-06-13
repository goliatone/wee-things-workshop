## Hello, LED!

In this tutorial we will use our NodeMCU board to react to a physical button.

We will combine this tutorial with Hello Blink and manage the state of an onboard LED. We will use a [Breadboard][breadboard] and a simple Button switch.

We will also introduce how to write modules in Lua.

### Wiring the Button
We use physical GPIO pins to interface with the things through code. We can listen for a button press as input, and use an LED as our output. To do so NodeMCU provides the [gpio][wiki-gpio] module.
