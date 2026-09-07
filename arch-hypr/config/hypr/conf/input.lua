-- Input configuration

-- Allows for adding custom layouts to XKB, this isn't being currently used
-- TODO: This line fully crahses the config, I'm guessing it has to do with homeDir being undefined
-- hl.env("XKB_CONFIG_ROOT", homeDir .. "/.config/xkb")

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

    sensitivity = 0.3, -- -1.0 - 1.0, 0 means no modification.
  },
})

