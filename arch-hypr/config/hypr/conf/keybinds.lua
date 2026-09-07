-- Keybinds

-- Launch apps
hl.bind(MOD4 .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(MOD4 .. " + E", hl.dsp.exec_cmd(fileExplorer))
hl.bind(MOD4 .. " + SPACE", hl.dsp.exec_cmd(appLauncher))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(commandLauncher))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(clipboard))

-- Manage session
hl.bind(MOD4 .. " + SHIFT + M", hl.dsp.exit()) -- Force quit hyprland
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

hl.bind(MOD4 .. " + F4", hl.dsp.window.close()) -- Close active window
hl.bind(MOD4 .. " + V", hl.dsp.window.float({ action = "toggle" })) -- Togfle floating for active window
hl.bind(MOD4 .. " + P", hl.dsp.window.pseudo()) -- TODO: name this
hl.bind(MOD4 .. " + J", hl.dsp.layout("togglesplit")) -- TODO: Not working
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true }) -- Move window with left click
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true }) -- Resize window with right click

--- Move window focus with mainMod + [arrows | hjkl]
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "down" }))

--- Manage workspaces
for i = 1, 10 do
  local key = i % 10
  hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i })) -- Switches active workspace
  hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i })) -- Moves active window to workspace
end

--- Move workspace to different monitor
hl.bind(mainMod .. " + CTRL + 1", hl.dsp.workspace.move({ monitor = mainMonitor}))
hl.bind(mainMod .. " + CTRL + 2", hl.dsp.workspace.move({ monitor = secondaryMonitor}))

--- Scroll through existing workspaces
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e+1" }))
