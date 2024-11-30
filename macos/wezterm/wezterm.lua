local wezterm = require 'wezterm'
local config = wezterm.config_builder()

local custom_catppuccin = wezterm.color.get_builtin_schemes()["Catppuccin Mocha"]
custom_catppuccin.background = "#15151c"
config.color_schemes = {
  ["DARKERppuccin"] = custom_catppuccin,
}
--config.color_scheme = "DARKERppuccin"
config.color_scheme = "Catppuccin Mocha"

config.font = wezterm.font("Iosevka Nerd Font Mono")
--config.font = wezterm.font("JetBrainsMono Nerd Font Mono")
config.font_size = 14

config.enable_tab_bar = false
--config.use_fancy_tab_bar = true

config.initial_cols = 192
config.initial_rows = 48

config.window_padding = {
  left = '1cell',
  right = '1cell',
  top = '0.5cell',
  bottom = '0.5cell',
}
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.75
config.macos_window_background_blur = 60

config.window_frame = {
  border_left_width = '0.1cell',
  border_right_width = '0.1cell',
  border_bottom_height = '0.05cell',
  border_top_height = '0.05cell',
  border_left_color = '#6c7086',
  border_right_color = '#6c7086',
  border_bottom_color = '#6c7086',
  border_top_color = '#6c7086',
}

config.window_close_confirmation = 'NeverPrompt'
--config.window_close_confirmation = 'AlwaysPrompt'

return config
