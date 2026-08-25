-- Autostart

hl.on("hyprland.start", function()
	hl.exec_cmd("~/.config/hypr/scripts/xdg-portal-hyprland")
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")

	hl.exec_cmd("awww-daemon")

	hl.exec_cmd(LaunchAndBindBar)
	hl.exec_cmd(LaunchBar)
	hl.exec_cmd(notificationManager)
	hl.exec_cmd(bluetoothManager)
	hl.exec_cmd(networkManager)
	hl.exec_cmd(SetClipboardTracker)
end)
