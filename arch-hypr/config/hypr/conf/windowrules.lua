-- Window and layer rules

-- Floating windows
hl.window_rule({ name = "pavucontrol-float", match = { class = "org.pulseaudio.pavucontrol" }, float = true })
hl.window_rule({ name = "blueman-float", match = { class = "^blueman-manager$" }, float = true })
hl.window_rule({ name = "network-manager-float", match = { class = "^(nm-connection-editor)$" }, float = true })
hl.window_rule({ name = "btop-float", match = { title = "^(btop)$" }, float = true })
hl.window_rule({ name = "loupe-float", match = { class = "^(org.gnome.Loupe)$" }, float = true })
hl.window_rule({ name = "portal-gtk-float", match = { class = "^(xdg-desktop-portal-gtk)$" }, float = true })
hl.window_rule({ name = "file-roller-float", match = { class = "^(org.gnome.FileRoller)" }, float = true })
hl.window_rule({ name = "viewnior-float", match = { class = "^(viewnior)$" }, float = true })
hl.window_rule({ name = "float-thunar-secondary-windows", match = { class = "^(?i)thunar$", title = "negative:^(.*) - (?i)thunar$" }, float = true })
--- Float and center all Steam windows except main one
hl.window_rule({ name = "steam-main-window", match = { class = "^(steam)$", title = "^(Steam)$" }, float = false })
hl.window_rule({ name = "steam-center", match = { class = "^(steam)$", title = "^(.+)$" }, center = true })

-- Position floating windows
hl.window_rule({ name = "pavucontrol-position", match = { class = "org.pulseaudio.pavucontrol" }, move = "100%-w-11 47", })

-- Tkinter
hl.window_rule({ name = "tk-center", match = { class = "Tk" }, center = true })
hl.window_rule({ name = "toplevel-center", match = { class = "Toplevel" }, center = true })

-- Layerrules
hl.layer_rule({ name = "wofi-dim", match = { namespace = "wofi" }, dim_around = true })
