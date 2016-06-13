-- We will use pin D3
PIN=3

-- Set gpio pin as OUTPUT
gpio.mode(PIN, gpio.OUTPUT)

function on()
    gpio.write(PIN, gpio.HIGH)
end

function off()
    gpio.write(PIN, gpio.LOW)
end
