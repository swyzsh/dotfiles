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
config.font_size = 14

config.enable_tab_bar = false
--config.use_fancy_tab_bar = true

config.window_padding = {
  left = '1cell',
  right = '1cell',
  top = '0.5cell',
  bottom = '0.5cell',
}
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.75
config.macos_window_background_blur = 60

return config
