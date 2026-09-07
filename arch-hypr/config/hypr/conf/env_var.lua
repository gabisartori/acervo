-- Environment variables

hl.env("XCURSOR_SIZE", "24")

-- XDG
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

hl.env("XDG_CONFIG_HOME", homeDir .. "/.config")
hl.env("XDG_DATA_HOME", homeDir .. "/.local/share")
hl.env("XDG_CACHE_HOME", homeDir .. "/.cache")

-- Personal variables
hl.env("EDITOR", "nvim")
