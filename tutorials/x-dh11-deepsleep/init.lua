-- Initialize the board but give us a few seconds to send a
-- file.remove('init.lua') in case we have an error
print("Executing init.lua")

local BOOT_DELAY = 2000
local BOOT_FILE = "boot.lua"

print("starting delay to run "..BOOT_FILE)

tmr.alarm(0, BOOT_DELAY, 0, function()
    print("Stop alarm... dofile('"..BOOT_FILE.."')")
    tmr.stop(0)
    dofile(BOOT_FILE)
end)
