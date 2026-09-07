-- Styling

hl.config({
  general = {
    gaps_in = 5,
    gaps_out = { top = 2, right = 5, bottom = 1, left = 5 },
    border_size = 2,
    col = {
      active_border = "rgb(cdd6f4)",
      inactive_border = "rgba(595959aa)",
    },
    layout = "dwindle",
  },

  misc = {
    disable_hyprland_logo = true,
  },

  decoration = {
    rounding = 5,

    blur = {
      enabled = false,
      size = 7,
      passes = 4,
      new_optimizations = true,
    },
  },

  animations = {
    enabled = true,
  },

  dwindle = {
    preserve_split = true,
  },
})

hl.curve("myBezier", { type = "bezier", points = { { 0.10, 0.9 }, { 0.1, 1.05 } } })

hl.animation({ leaf = "windows", enabled = true, speed = 7, bezier = "myBezier", style = "slide" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 7, bezier = "myBezier", style = "slide" })
hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 7, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 6, bezier = "default" })
