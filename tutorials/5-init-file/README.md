## Init File


### Creating a new file

We will create a new file, and name it `init.lua`. This is a very special file, because every time when the board boots it will look for a file named `init.lua` and it will automatically execute it.

Because of this, we need to be very careful to not upload a `init.lua` file that generates any **panic** errors. This would cause the board to reboot. Once booted it will enter a panic reboot infinite loop bricking the board.

It's recommended to keep `init.lua` files really simple and add a guard using a timer. We will cover that up later on.

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


[watchdog]: https://en.wikipedia.org/wiki/Watchdog_timer
