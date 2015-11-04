local LED = 0
local lighton = false

gpio.mode(LED, gpio.OUTPUT)

-- time is in milliseconds
tmr.alarm(1, 2000, 1, function()
    if lighton == false then
        lighton = true
        gpio.write(LED, gpio.HIGH)
    else
        lighton = false
        gpio.write(LED, gpio.LOW)
    end
end)
