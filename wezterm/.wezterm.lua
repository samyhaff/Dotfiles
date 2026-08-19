local wezterm = require 'wezterm'
local config = wezterm.config_builder()
config.font = wezterm.font("JetBrains Mono")
config.font_size = 10.5
config.enable_tab_bar = false
config.window_padding = {
  left = 8,
  right = 8,
  top = 8,
  bottom = 8,
}
config.colors = {
    foreground = "#24292e",
    background = "#ffffff",
    cursor_bg = "#0366d6",
    cursor_border = "#0366d6",
    cursor_fg = "#ffffff",
    selection_bg = "#24292e",
    selection_fg = "#ffffff",
    ansi = {"#24292e","#d73a49","#28a745","#6f42c1","#0366d6","#6f42c1","#1b7ec2","#e1e4e8"},
    brights = {"#6a737d","#f97583","#85e89d","#b392f0","#79b8ff","#c8e1ff","#56d4dd","#ffffff"},
}
config.warn_about_missing_glyphs = false
return config
