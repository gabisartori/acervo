-- Default applications

terminal = "alacritty"
fileExplorer = "alacritty -e yazi"
appLauncher = "wofi"
commandLauncher = "wofi --show run"
clipboard = [[cliphist list | wofi -dmenu | cliphist decode | wl-copy]]
notificationManager = "mako"
bluetoothManager = "blueman-applet"
networkManager = "nm-applet --indicator"
musicPlayer = "vlc"
