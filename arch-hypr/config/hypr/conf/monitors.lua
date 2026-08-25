-- Monitor configuration

mainMonitorOutput = "DP-1"
secondaryMonitorOutput = "HDMI-1"

mainMonitor = hl.monitor({
	output = mainMonitorOutput,
	mode = "1920x1080@100",
	position = "0x0",
	scale = "1",
})

hl.monitor({
	output = secondaryMonitorOutput,
	mode = "1920x1080@60",
	position = "1920x0",
	scale = "1",
})

