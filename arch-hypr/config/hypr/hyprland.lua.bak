-- Hyprland 0.56 Lua config entrypoint

MOD1 = "SHIFT"
MOD2 = "CTRL"
MOD3 = "SUPER"
MOD4 = "ALT"

mainMod = MOD3

local configDir = (os.getenv("HOME") or "") .. "/.config/hypr/conf/"

dofile(configDir .. "env_var.conf")
dofile(configDir .. "env_var_nvidia.conf")
dofile(configDir .. "apps.conf")
dofile(configDir .. "essentials.conf")
dofile(configDir .. "monitors.conf")

if mainMonitor then
	mainMonitor:set_workspace(1)
end

dofile(configDir .. "input.conf")
dofile(configDir .. "launch.conf")
dofile(configDir .. "styling.conf")
dofile(configDir .. "windowrules.conf")
dofile(configDir .. "keybinds.conf")

