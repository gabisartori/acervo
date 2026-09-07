-- Hyprland 0.56 Lua config entrypoint
-- require("hyprland.lib")
-- require("hyprland.services")

MOD1 = "SHIFT"
MOD2 = "CTRL"
MOD3 = "SUPER"
MOD4 = "ALT"

mainMod = MOD3

homeDir = (os.getenv("HOME") or "")
configDir = homeDir .. "/.config/hypr/conf/"

-- List of devices I'll have this config on
-- TODO: Think of a more extensable way of naming things
-- I'd like for it to be kept simple as there aren't many options
-- But I also want for conflicts to be handled gracefully
--- desktop
--- laptop
device = "desktop"

require("/home/sartori/.config/hypr/conf/env_var.lua")
-- TODO: Only run this if nvidia card is present
require(configDir .. "env_var_nvidia.lua")
require(configDir .. "apps.lua")
require(configDir .. "essentials.lua")
require(configDir .. "monitors.lua")

-- Binds workspace 1 to mainMonitor
-- TODO: I'm not sure why this clause is necessary, I'm guessing workspace 1 will always be on main monitor
if mainMonitor then
  hl.workspace_rule({ workspace = 1, monitor = mainMonitor })
end

require(configDir .. "input.lua")
require(configDir .. "launch.lua")
require(configDir .. "styling.lua")
require(configDir .. "windowrules.lua")
require(configDir .. "keybinds.lua")

