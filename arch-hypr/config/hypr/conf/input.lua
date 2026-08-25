-- Input configuration

hl.env("XKB_CONFIG_ROOT", (os.getenv("HOME") or "") .. "/.config/xkb")

hl.config({
    input = {
        kb_layout = "br",
        kb_variant = "abnt2",
        kb_model = "",
        kb_options = "",
        kb_rules = "",

        follow_mouse = 1,

        touchpad = {
            natural_scroll = true,
            scroll_factor = 1.5,
        },

        sensitivity = 0.3,
    },
})

