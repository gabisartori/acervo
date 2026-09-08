-- Monitor configuration
if device == "desktop" then
  mainMonitor = "DP-1"
  secondaryMonitor = "HDMI-A-1"

  hl.monitor({
    output = mainMonitor,
    mode = "1920x1080@100",
    position = "0x0",
    scale = "1",
  })

  hl.monitor({
    output = secondaryMonitor,
    mode = "1920x1080@60",
    position = "1920x0",
    scale = "1",
  })

elseif device == "laptop" then

  mainMonitor = "eDP-1"
  secondaryMonitor = mainMonitor -- Laptop only has once screen.

  hl.monitor({
    output = mainMonitor,
    mode = "1920x1080@60",
    position = "0x0",
    scale = 1
  })

  -- Setup any next connection to be a mirror of main screen
  -- Most common use case will be for whenever the HDMI port is connected
  -- But I want to make it fairly extensible for unforeseeable cases
  hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    mirror = mainMonitor
  })
end
