-- Settings
-- MQTT
mqtt_broker_ip = "192.168.1.100"
mqtt_broker_port = 1883
mqtt_username = ""
mqtt_password = ""
mqtt_client_id = "wee-thing-"..node.chipid()

-- WiFi sta
stacfg = {}
stacfg.ssid = "<YOUR_SSID>"
stacfg.pwd = "<YOUR_SSID_PASSWORD>"

-- WiFi
ipcfg = {}
ipcfg.ip = "192.168.1.4"
ipcfg.netmask = "255.255.255.0"
ipcfg.gateway = "192.168.1.1"

-- SNTP Address
SNTP_IP = '137.190.2.4'

time_between_sensor_readings = 60 * 1000 * 1000

m = mqtt.Client(mqtt_client_id, 120, mqtt_username, mqtt_password)

humidity, temperature = 0, 0

-- Connect to the wifi network
wifi.setmode(wifi.STATION)
wifi.setphymode(wifi.PHYMODE_N)


wifi.sta.config(stacfg.ssid, stacfg.pwd)
if ipcfg.ip ~= "" then wifi.sta.setip(ipcfg) end

wifi.sta.eventMonReg(wifi.STA_GOTIP, function()
    -- we need pass in a closure, pass in on_connect_success
    -- fails, thinking it's a string
    on_connect_success()
end)
wifi.sta.eventMonStart()

--WiFi connection callback
function on_connect_success()
    print("Device IP: " .. wifi.sta.getip())
    wifi.sta.eventMonStop()
    -- unregister, docs say pass nothing but...
    wifi.sta.eventMonReg(wifi.STA_GOTIP, "unreg")
    sntp.sync(SNTP_IP,
        function(sec, usec, server)
            rtctime.set(sec)
            print('Time sync:', sec, server) -- sync success
            run_main()
        end,
        function()
            print('Time sync failed!')
        end
    )
end

-- main routine
function run_main()
    print("run main function", mqtt_broker_ip, mqtt_broker_port)
    -- we should run a timeout, to make sure we catch a wrong IP
    m:connect( mqtt_broker_ip , mqtt_broker_port, 0, function(conn)
        print("Connected to MQTT")
        print("  IP: ".. mqtt_broker_ip)
        print("  Port: ".. mqtt_broker_port)
        print("  Client ID: ".. mqtt_client_id)
        print("  Username: ".. mqtt_username)
        -- Get sensor data
        payload = get_sensor_data()

        m:publish("things/ESP8266/dht", payload, 0, 0, function(conn)
            print("Going to deep sleep for "..(time_between_sensor_readings/1000).." seconds")
            mqtt:close()
            -- local tm = rtctime.get()
            -- rtctime.dsleep((590 - ( tm - timestamp )) * 1000000, 2)
            rtctime.dsleep(time_between_sensor_readings, 2)
            -- node.dsleep(time_between_sensor_readings, 2)
        end)
    end, function(conn, err)
        print("wop woop wop..."..err)
    end)
end

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
