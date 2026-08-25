-- Environment variables

hl.env("XCURSOR_SIZE", "24")

hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

hl.env("XDG_CONFIG_HOME", (os.getenv("HOME") or "") .. "/.config")
hl.env("XDG_DATA_HOME", (os.getenv("HOME") or "") .. "/.local/share")
hl.env("XDG_CACHE_HOME", (os.getenv("HOME") or "") .. "/.cache")

hl.env("EDITOR", "nvim")
