-- Initialize WiFi access point and connect to router
cfg = {
    ssid = "WEE_THINGS_"..node.chipid(),
    pwd = "weething"
}
-- wifi.setmode(wifi.SOFTAP)
wifi.setmode(wifi.STATIONAP)
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

-- Initialize LED pin
gpio.mode(4, gpio.OUTPUT)

-- Create a server
srv = net.createServer(net.TCP)
srv:listen(80, function(conn)
    conn:on('sent', function(conn)
        conn:close()
    end)

    conn:on('receive', function(conn, payload)
        -- Handle index request
        if payload:find('GET /') == 1 then
            conn:send('HTTP/1.0 200 OK\r\n\r\n' ..
                '<html><head><meta charset="utf-8"><title>Wee Things</title></head>' ..
                '<body><input type="button" value="Toggle LED" onclick="x=new XMLHttpRequest();x.open(\'POST\', \'pin/\'+(b=1-b));x.send()" /></body>' ..
                '<script>b=0</script></html>')
        end

        -- Handle POST request to pin/0
        -- we set LED on
        if payload:find('POST /pin/0') == 1 then
            gpio.write(4, gpio.LOW)
            conn:send('HTTP/1.0 204 No Content\r\n\r\n')
        end

        -- Handle POST request to pin/1
        -- we set LED off
        if payload:find('POST /pin/1') == 1 then
            gpio.write(4, gpio.HIGH)
            conn:send('HTTP/1.0 204 No Content\r\n\r\n')
        end
    end)
end)
