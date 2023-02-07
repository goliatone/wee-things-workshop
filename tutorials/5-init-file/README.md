
## Init File

In this tutorial we will learn how to make our board to run a script on power up. During the boot process, NodeMCU looks for a file named `init.lua` executing the file thus making it an entry point for your application.

### Crashes and Bricks

We will create a new file, and name it `init.lua`. This is a very special file, because every time when the board boots it will look for this file and it will automatically execute it.

When an error happens Lua calls a panic function and then exits the host application. NodeMCU's behavior is to reboot when this happens.

Because of this, we need to be very careful to not generate **panic** errors during the boot sequence. Any piece of code executed during the boot sequence would cause the board to reboot. Once booted, the same code would get executed and panic again, entering a panic-reboot infinite loop making your board unusable, or bricked. As in as useful as a brick.

Usually the way we recover from a panic-reboot cycle is by removing the init file, breaking the cycle. However, if the panic happens to early in the boot sequence we might not be able to issue a `file.remove("init.lua")` in time.


### Creating a new file

It's recommended to keep `init.lua` files really simple and add a guard using a timer. We will cover that up later on.

While testing the best practice is to use a different file to hold our code and execute that manually. Then, once we are sure our code is in good shape we can proceed to change it's name to `init.lua`.

Ideally we would devise a simple and generic `init.lua` that we can use in most use-cases. A simple solution is to place an idle timer that delays the execution of the next step, whatever that step might be. That way we get a window of time to issue a `file.remove("init.lua")`. If we move our real initialization logic to a different file, then we can wait a safe amount of time, and then execute this file.


### Generic init file

We could use this generic `init.lua` file to serve our purposes.

```lua
-- Initialize the board but give us a few seconds to send a
-- file.remove('init.lua')

print("init.lua executing")

local BOOT_ALARM = 0
local BOOT_DELAY = 2000
local BOOT_FILE = "boot.lua"

print("starting delay to run "..BOOT_FILE)

tmr.alarm(BOOT_ALARM, BOOT_DELAY, 0, function()
    print("Stop alarm... dofile('"..BOOT_FILE.."')")
    tmr.stop(BOOT_ALARM)
    dofile(BOOT_FILE)
end)
```

`tmr.alarm` executes a function in intervals of time. It takes 4 parameters. The first one is a numerical id so we can can cancel it with a call to `tmr.stop`. The second is the interval in milliseconds. The third one indicates whether the callback is executed one or until we stop the interval. The fourth is the callback that gets executed on each interval.

The following snippet executes the callback once after a delay of two seconds.
```lua
tmr.alarm(0, 2000, 0, function()
    ...
end)
```

Inside the callback we are stopping `tmr.alarm` and loading our `boot.lua` script that will hold the logic to bootstrap the program.

We load and execute the `boot.lua` script by calling it with the `dofile` directive:

```lua
dofile('boot.lua')
```

What we get is a two second pause in which we can issue a `file.remove('init.lua')` to abort the execution of the script.

### WatchDog

The NodeMCU SDK employs an event-driven for programming at the application level. This event-driven approach is very different from the procedural paradigm you will see in most Lua programs or Arduino sketches.

Arduino sketches have a main loop where you place your code. It's also common practice in Arduino sketches to use `delays` or make our code sleep waiting for something to happen.

NodeMCU is single threaded. The ESP8266 uses a [WatchDog][watchdog] timer to detect and recover from code misbehavior. Tight loops or units of code that take a long time to execute trigger the watchdog, which in turn restarts the firmware. This is a drastic and expedient measure to reset the program's state by expecting the conditions that triggered the watchdog being transient.

The best way to deal with this is by using the built in event system which is similar to JavaScript's event system.

For instance, albeit valid code, the following would not work in NodeMCU:

```lua
isConnected = false
repeat
   -- Lets see if we are already connected by getting the IP
   ipAddr = wifi.sta.getip()
   if ( ( ipAddr ~= nil ) and  ( ipAddr ~= "0.0.0.0" ) )then  -- Check if IP is valid
      isConnected = true
   end

until ( isConnected == true )
```

The reason being the loop would hang the board, kicking in the watchdog timer, restarting the firmware. Read more about it [here][example]


[watchdog]: https://en.wikipedia.org/wiki/Watchdog_timer
[example]: https://primalcortex.wordpress.com/2014/12/30/esp8266-nodemcu-and-lua-language-and-some-arduino-issues/
