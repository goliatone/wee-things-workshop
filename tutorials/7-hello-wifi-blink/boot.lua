-- Initialize WiFi access point
wifi.setmode(wifi.STATIONAP)

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

-- Initialize LED pin
gpio.mode(4, gpio.OUTPUT)

-- Close any server instances running
if server then srv:close() end

-- Create a server
srv = net.createServer(net.TCP)

srv:listen(80, function(conn)
    -- close the connection once we are done
    conn:on('sent', function(conn)
        conn:close()
    end)

    -- handle all incomming requests
    conn:on('receive', function(conn, payload)
        -- Handle requests to http://192.168.4.1
        if payload:find('GET /') == 1 then
            conn:send("HTTP/1.0 200 OK\r\nContent-type: text/html\r\nServer: wee-thing\r\n\n")
            conn:semd('<html><head><meta charset="utf-8"><title>Wee Things</title></head>')
            conn:semd('<style>html{background-color:#212121; color:#fafafa}</style>')
            conn:send('<body><h3>Wee Things</h3><p>Use the button to toggle the board LED</p>')
            conn:send('<input type="button" value="Toggle LED" onclick="x=new XMLHttpRequest();x.open(\'POST\', \'led/\'+(b?\'on\':\'off\'));x.send();b=!b;" /></body>')
            conn:send('<script>b=true</script></html>')
        end

        -- POST request to "http://192.168.4.1/led/on"
        if payload:find('POST /led/on') == 1 then
            gpio.write(4, gpio.LOW) -- turn LED on
            conn:send('HTTP/1.0 204 No Content\r\n\r\n')
        end

        -- POST request to "http://192.168.4.1/led/off"
        if payload:find('POST /led/off') == 1 then
            gpio.write(4, gpio.HIGH) -- turn LED off
            conn:send('HTTP/1.0 204 No Content\r\n\r\n')
        end
    end)
end)
