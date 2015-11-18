## WiFi

In this tutorial we will learn how to configure our NodeMCU board to connect to the internet and also how to configure it as an Access Point so we can connect to it through a web browser.

We will be using the `wifi` module. You can check the full API in the NodeMCU [wiki][wifi-module].


### Intro

The [NodeMCU firmware][wiki] provides the `wifi` module to configure and manage... well, wifi things.

The API provides two submodules; `sta`, and `ap`. Any NodeMCU board can function in three different modes:

* STATION: Connect to a router for internet connectivity.
* SOFTAP: Board reachable through IP- ie browser.
* STATIONAP: Acts as both STATION and SOFTAP modes.

We will configure the board's wifi mode as **SOFTAP**, this will create a local network to which we can connect using the browser.

```lua
wifi.setmode(wifi.SOFTAP)
```

The next step will be to configure te access point with the necessary credentials so that we can connect to the network.

To give the local network a unique name we are going to use the board's unique id, which we access using the `node.chipid` function. The name look something like  **WEE_THINGS_315587**, depending on the actual chip id of your board.

The password to connect to this network will be **weething**.

```lua
cfg = {
    ssid = "WEE_THINGS_"..node.chipid(),
    pwd = "weething"
}
wifi.ap.config(cfg)
```

We then have to configure the **IP** address clients will use to connect to the board:

```lua
address = {
  ip = '192.168.4.1',
  netmask = '255.255.255.0',
  gateway = '192.168.4.1'
}
wifi.ap.setip(address)
```

If we load this code into the board and we scan the local networks we should be able to see the one we just created:

![wifi-networks](https://raw.githubusercontent.com/goliatone/wee-things-workshop/master/images/wifi-config-001.png)


### Source Code

The full script:

`boot.lua`:
```lua
-- Initialize WiFi access point
wifi.setmode(wifi.SOFTAP)

-- Configure the access point
cfg = {
    ssid = "WEE_THINGS_"..node.chipid(),
    pwd = "weething"
}
wifi.ap.config(cfg)

print('Wifi mode: ', wifi.getmode())
print('MAC: ', wifi.sta.getmac())
print('')
print('Created WiFi network:')
print('Network Name')
print('- SSID: ', cfg.ssid)
print('Security: WPA/WPA 2 Personal')
print('- PWD: ', cfg.pwd)
print('')

address = {
  ip = '192.168.4.1',
  netmask = '255.255.255.0',
  gateway = '192.168.4.1'
}
wifi.ap.setip(address)

print('IP: ', wifi.ap.getip())
```


[wifi-module]: https://github.com/nodemcu/nodemcu-firmware/wiki/nodemcu_api_en#wifi-module
