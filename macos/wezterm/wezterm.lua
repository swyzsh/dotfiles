local wezterm = require("wezterm")
local config = wezterm.config_builder()

local custom_catppuccin = wezterm.color.get_builtin_schemes()["Catppuccin Mocha"]
custom_catppuccin.background = "#1a1b26"
config.color_schemes = {
	["DARKERppuccin"] = custom_catppuccin,
}
--config.color_scheme = "DARKERppuccin"
-- config.color_scheme = "Catppuccin Mocha"
-- config.color_scheme = "tokyonight_moon"
config.color_scheme = "tokyonight_night"

--config.font = wezterm.font("Iosevka Nerd Font Mono")
--config.font = wezterm.font("JetBrainsMono Nerd Font Mono")
--config.font = wezterm.font("0xProto Nerd Font")
--config.font = wezterm.font("BigBlueTermPlus Nerd Font")
config.font = wezterm.font("DepartureMono Nerd Font")
--config.font = wezterm.font("GohuFont uni14 Nerd Font Mono")

config.font_size = 14

config.enable_tab_bar = false
--config.use_fancy_tab_bar = true

config.initial_cols = 150
config.initial_rows = 50

config.window_padding = {
	left = "1cell",
	right = "1cell",
	top = "0.5cell",
	bottom = "0.5cell",
}
config.window_decorations = "RESIZE"
-- config.window_background_opacity = 0.90
-- config.macos_window_background_blur = 60

config.window_frame = {
	border_left_width = "0.1cell",
	border_right_width = "0.1cell",
	border_bottom_height = "0.05cell",
	border_top_height = "0.05cell",
	border_left_color = "#525252",
	border_right_color = "#525252",
	border_bottom_color = "#525252",
	border_top_color = "#525252",
}

config.window_close_confirmation = "NeverPrompt"
--config.window_close_confirmation = 'AlwaysPrompt'

return config
