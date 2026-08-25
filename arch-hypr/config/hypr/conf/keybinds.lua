-- Keybinds

-- Launch apps
hl.bind(MOD4 .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(MOD4 .. " + E", hl.dsp.exec_cmd(fileExplorer))
hl.bind(MOD4 .. " + SPACE", hl.dsp.exec_cmd(appLauncher))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(commandLauncher))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(clipboard))

-- Manage session
hl.bind(MOD4 .. " + SHIFT + M", hl.dsp.exit())
hl.bind(MOD4 .. " + M", hl.dsp.exec_cmd(ShowLogoutMenu))
hl.bind(MOD4 .. " + L", hl.dsp.exec_cmd(LockScreen))
hl.bind(MOD4 .. " + SHIFT + R", hl.dsp.exec_cmd("hyprctl reload"))

-- Screenshots
hl.bind(MOD4 .. " + S", hl.dsp.exec_cmd(ScreenshotSelection))
hl.bind("SHIFT + PRINT", hl.dsp.exec_cmd(ScreenshotSelection))
hl.bind(MOD2 .. " + " .. MOD4 .. " + S", hl.dsp.exec_cmd(ScreenshotMainMonitor))
hl.bind("PRINT", hl.dsp.exec_cmd(ScreenshotMainMonitor))
hl.bind(MOD2 .. " + " .. MOD4 .. " + SHIFT + S", hl.dsp.exec_cmd(ScreenshotSecondaryMonitor))

-- Windows and workspaces

hl.bind(MOD4 .. " + F4", hl.dsp.window.close())
hl.bind(MOD4 .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(MOD4 .. " + P", hl.dsp.window.pseudo())
hl.bind(MOD4 .. " + J", hl.dsp.layout("togglesplit"))
hl.bind(MOD4 .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(MOD4 .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "down" }))

for i = 1, 10 do
	local key = i % 10
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + CTRL + 1", hl.dsp.exec_cmd("hyprctl dispatch movecurrentworkspacetomonitor 1"))
hl.bind(mainMod .. " + CTRL + 2", hl.dsp.exec_cmd("hyprctl dispatch movecurrentworkspacetomonitor 0"))

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e+1" }))
