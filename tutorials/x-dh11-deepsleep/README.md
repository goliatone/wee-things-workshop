## Sleepy Node

In this tutorial we will learn how to configure our NodeMCU board so that it goes into deep-sleep mode. We will also read temperature and humidity values using a [DHT11][dht11] sensor. We will put the sensor to deep sleep between readings to preserve battery life.

We will be using the `dht` module, which needs a custom build. You can check the full API in the NodeMCU [wiki][dht-module].


### Intro

If you have a[ NodeMCU custom build][custom-build], ensure the `dht` module was selected. Otherwise you will need a new build with the following modules:

- dht
- mqtt

The build service is pretty straight forward and easy to use. The only tricky part is dependency management, which due to a lack of guidance from NodeMCU.

Once you have a build, flash the board with it, if you need instructions you can follow the [intro tutorial][intro-tutorial]


### Source Code

#### init

We will be using an `init.lua` file like the one introduced in [this tutorial][tutorial-init], which explains why we want to keep it simple and why we have a small delay before executing our main routine.

```lua
print("Executing init.lua")

local BOOT_DELAY = 2000
local BOOT_FILE = "boot.lua"

print("starting delay to run "..BOOT_FILE)

tmr.alarm(0, BOOT_DELAY, 0, function()
    print("Stop alarm... dofile('"..BOOT_FILE.."')")
    tmr.stop(0)
    dofile(BOOT_FILE)
end)
```

#### WiFi
To establish the WiFi connection and monitor when the device gets an IP assigned we will use the `wifi` event monitoring facility.

The relevant code:

```lua
wifi.sta.eventMonReg(wifi.STA_GOTIP, function()
    on_connect_success()
end)

wifi.sta.eventMonStart()

--WiFi connection callback
function on_connect_success()
    print("Device IP: " .. wifi.sta.getip())
    wifi.sta.eventMonStop()
    -- unregister, need to pass "unreg"
    wifi.sta.eventMonReg(wifi.STA_GOTIP, "unreg")
end
```

By using this callback mechanism we avoid having to set a timer to check if the device has an IP, which is something you see in many tutorials out there.

This is partially due to `eventMonReg` being a new feature or not working properly in older builds of the firmware.

#### MQTT
[MQTT][mqtt-org] is a lightweight IoT publish/subscribe messaging transport.

You will need a NodeMCU build that includes the `mqtt` module.

You need to have a valid MQTT broker to publish to and client to show the messages as they arrive to show your sensor's readings. We can use the [mosquitto][mosquitto] broker.

To do this locally, you could do it the right way and [run it with docker][docker-mosquitto], or you can be naughty and just `brew` it.

The commands you need to run if you have a local copy of mosquitto are:

To start the MQTT mosquitto broker, type the following command in a terminal window:

```
$ mosquitto
```

To start a client that shows the messages as they come in, type the following command in a terminal window:

```
$ mosquitto_sub -t things/ESP8266/dht
```
We are subscribing to the `things/ESP8266/dht` topic which then we will be publishing to from our lua program.

Then, inside your main Lua file, you need to instantiate the MQTT client:

```lua
m = mqtt.Client(mqtt_client_id, 120, mqtt_username, mqtt_password)
```

The `120` means a keep alive interval of 2 minutes, basically our client should publish a message before this interval ends.

```lua
m:connect( mqtt_broker_ip , mqtt_broker_port, 0, function(conn)
    -- Get sensor data
    payload = get_sensor_data()

    m:publish("things/ESP8266/dht", payload, 0, 0, function(conn)
        print("Going to deep sleep for "..(time_between_sensor_readings/1000).." seconds")
        mqtt:close()
        node.dsleep(time_between_sensor_readings, 2)
    end)
end, function(conn, err)
    print("wop woop wop..."..err)
end)
```

#### Deep Sleep

```lua
node.dsleep(time_between_sensor_readings, 2)
```

#### DHT11, DHTXX

We will use a [DHT-11][dht-11] humidity and temperature sensor, which thanks to the [dht][nodemcu-dht] module we can interface with rather easily.


```lua
-- DHT22 sensor logic
function get_sensor_data()
    pin = 3
    status, t, h = dht.read11(pin)

    if status == dht.OK then
        temperature, humidity = t, h
        print("Temperature: "..temperature.." deg C")
        print("Humidity: "..humidity.."%")
    elseif status == dht.ERROR_CHECKSUM then
        print( "DHT-11 Checksum error." );
    elseif( status == dht.ERROR_TIMEOUT ) then
        print( "DHT-11 Time out." );
    end

    timestamp = rtctime.get()
    payload = '{"t":'..temperature..' , "h":'..humidity..', "id":'..node.chipid()..', "tp":'..timestamp..'}'

    return payload
end
```





[nodemcu-dht]:http://nodemcu.readthedocs.org/en/dev/en/modules/dht/
[dht-11]:http://www.amazon.com/Temperature-Relative-Humidity-Compatible-Arduino/dp/B00TM87YRS
[tutorial-init]:https://github.com/goliatone/wee-things-workshop/tree/master/tutorials/5-init-file
[dht11]:http://www.amazon.com/Qunqi-Temperature-Humidity-Arduino-Raspberry/dp/B014PCKTF4
[dht-module]:http://nodemcu.readthedocs.org/en/dev/en/modules/dht
[custom-build]:http://nodemcu-build.com/
[intro-tutorial]:https://github.com/goliatone/wee-things-workshop#flashing-the-nodemcu
[mqtt-org]: http://mqtt.org
[mosquitto]:http://mosquitto.org/
[docker-mosquitto]:https://hub.docker.com/r/toke/mosquitto/
[nodemcu-mqtt]:http://nodemcu.readthedocs.org/en/dev/en/modules/mqtt/
