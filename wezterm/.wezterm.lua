local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.color_scheme = 'tokyonight_night'

config.font = wezterm.font("JetBrains Mono")
config.font_size = 11.5

config.enable_tab_bar = false

config.window_padding = {
  left = 8,
  right = 8,
  top = 8,
  bottom = 8,
}

return config
