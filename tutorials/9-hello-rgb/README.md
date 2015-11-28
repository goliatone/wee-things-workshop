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

![hello-led-1](https://raw.githubusercontent.com/goliatone/wee-things-workshop/master/images/hello-led-001.png)

### Snippets

We can use the snippet feature of ESPLorer to control the on/off status of an RGB LED.



Snippet to turn Red On:
* Click **Edit Snippet  0**
* Paste: `gpio.write(RED_PIN, gpio.LOW)`
* Rename to: Red On

![hello-led-snippets-1](https://raw.githubusercontent.com/goliatone/wee-things-workshop/master/images/hello-led-snippets-001.png)

Snippet to turn Red Off:
* Click **Edit Snippet  1**
* Paste: `gpio.write(RED_PIN, gpio.HIGH)`
* Rename to: Red Off

![hello-led-snippets-2](https://raw.githubusercontent.com/goliatone/wee-things-workshop/master/images/hello-led-snippets-002.png)

The rest of controls are pretty much the same, just changing the name of the ping we are going to address.

* Click **Edit Snippet  2**
* Paste: `gpio.write(GREEN_PIN, gpio.LOW)`
* Rename to: Green On

* Click **Edit Snippet  3**
* Paste: `gpio.write(GREEN_PIN, gpio.HIGH)`
* Rename to: Green Off

* Click **Edit Snippet  4**
* Paste: `gpio.write(BLUE_PIN, gpio.LOW)`
* Rename to: Blue On

* Click **Edit Snippet  5**
* Paste: `gpio.write(BLUE_PIN, gpio.HIGH)`
* Rename to: Blue Off

Then, we should see the snippets appear on the bottom right corner of the IDE:



![hello-led-snippets-3](https://raw.githubusercontent.com/goliatone/wee-things-workshop/master/images/hello-led-snippets-003.png)
