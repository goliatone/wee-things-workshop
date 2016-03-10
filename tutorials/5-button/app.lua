local App = {}

function onpindown(level)
    print("Pin down level"..level, "Read value "..gpio.read(2))
    gpio.write(0, gpio.read(2))
end

function App.start()
    gpio.mode(0, gpio.OUTPUT)

    gpio.mode(2, gpio.INPUT, gpio.PULLUP)
    gpio.trig(2, 'both', onpindown)
end

App.start();
