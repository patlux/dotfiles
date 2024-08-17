local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.color_scheme = 'Sonokai (Gogh)'
config.font = wezterm.font 'MesloLGS Nerd Font'
config.font_size = 20.0

config.tab_bar_at_bottom = true

-- Left Option + n = ~
config.send_composed_key_when_left_alt_is_pressed = true

config.window_padding = {
  left = 0,
  right = 0,
  top = '1%',
  bottom = 0,
}

config.window_decorations = "RESIZE"

local act = wezterm.action
config.keys = {
  { key = '.', mods = 'CTRL',       action = act.ActivateTabRelative(1) },
  { key = ',', mods = 'CTRL',       action = act.ActivateTabRelative(-1) },
  { key = '.', mods = 'SHIFT|CTRL', action = act.MoveTabRelative(1) },
  { key = ',', mods = 'SHIFT|CTRL', action = act.MoveTabRelative(-1) },
  { key = '+', mods = 'CMD',        action = act.IncreaseFontSize },
}

return config
