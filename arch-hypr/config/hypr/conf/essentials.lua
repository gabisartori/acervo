-- Screenshots

ScreenshotMainMonitor = [[grim -g "0,0 1920x1080" - | swappy -f -]]
ScreenshotSecondaryMonitor = [[grim -g "1920,0 1920x1080" - | swappy -f -]]
ScreenshotSelection = [[grim -g "$(slurp)" - | swappy -f -]]

-- Session management

LockScreen = "swaylock"
ShowLogoutMenu = "wlogout --protocol layer-shell"

-- Background processes

LaunchAndBindBar = [[ls ~/.config/waybar/conf/* | entr -s ". ~/.config/waybar/scripts/build-config.sh"]]
LaunchBar = "~/.config/waybar/scripts/launch-waybar.sh"
SetClipboardTracker = "wl-paste --watch cliphist store"