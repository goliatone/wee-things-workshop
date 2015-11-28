Using actual LEDs


Ping out:
Common anode LED, four legs. Wire the longest one to Vout. The other three to the following pins: 3, 5, 6. We can't use 4 since is an onboard LED.
The `gpio` pins in the NodeMCU board all digital, which means that we can do on/off but not control the brightness which we could do with an analog signal.


```
_[''''']_
---------
 | | | |
 | | | |
 R | G B
   Vin
```

Pin out:

```
Vin => 3.3v
R => 6
G => 7
B => 5
```

```lua
GREEN_PIN  = 7    -- GPIO2
RED_PIN    = 6
BLUE_PIN   = 5
```

### Snippets

We can use the snippet feature of ESPLorer to control the on/off status of an RGB LED.

![hello-led-1](https://raw.githubusercontent.com/goliatone/wee-things-workshop/master/images/hello-led-001.png)

Edit Snipet  0
`gpio.write(RED_PIN, gpio.LOW)`
Rename to Red On

Edit Snipet  1
`gpio.write(RED_PIN, gpio.HIGH)`
Rename to Red Off

Edit Snipet  2
`gpio.write(GREEN_PIN, gpio.LOW)`
Rename to Green On

Edit Snipet  3
`gpio.write(GREEN_PIN, gpio.HIGH)`
Rename to Green Off

Edit Snipet  4
`gpio.write(BLUE_PIN, gpio.LOW)`
Rename to Blue On

Edit Snipet  5
`gpio.write(BLUE_PIN, gpio.HIGH)`
Rename to Blue Off
