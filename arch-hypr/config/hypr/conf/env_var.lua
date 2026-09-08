-- Environment variables

hl.env("XCURSOR_SIZE", "24")

-- XDG
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

hl.env("XDG_CONFIG_HOME", homeDir .. "/.config")
hl.env("XDG_DATA_HOME", homeDir .. "/.local/share")
hl.env("XDG_CACHE_HOME", homeDir .. "/.cache")

-- Setup Ibus
-- TODO: I don't think this is actually working rn
-- I should also replace ibus with fcitx
hl.env("GTK_IM_MODULE", "ibus")
hl.env("QT_IM_MODULE", "ibus")
hl.env("SDL_IM_MODULE", "ibus")
hl.env("XMODIFIERS", "@im=ibus")

-- Personal variables
hl.env("EDITOR", "nvim")
