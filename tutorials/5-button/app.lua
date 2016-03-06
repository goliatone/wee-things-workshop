local App = {}

App.count = 0

function onpindown(level)
    App.count = App.count + 1
    print("Pin down", level, App.count % 2)
    gpio.write(0, App.count % 2)
end

function App.start()
    gpio.mode(2, gpio.INPUT, gpio.PULLUP)
    gpio.trig(2, 'both', onpindown)
end

App.start();
