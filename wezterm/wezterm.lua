local wezterm = require("wezterm")
local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")
local config = wezterm.config_builder()

-- System --
config.audible_bell = "Disabled"

-- Theming --
-- local custom_catppuccin = wezterm.color.get_builtin_schemes()["Catppuccin Mocha"]
-- custom_catppuccin.background = "#1a1b26"
-- config.color_schemes = {
-- 	["DARKERppuccin"] = custom_catppuccin,
-- }
-- config.color_scheme = "DARKERppuccin"
-- config.color_scheme = "Catppuccin Mocha"
-- config.color_scheme = "tokyonight_moon"
-- config.color_scheme = "tokyonight_night"
-- config.color_scheme = "Material (base16)"
config.color_scheme = "nightfox"
-- config.color_scheme = "GruvboxDark"
-- config.color_scheme = "GitHub Dark"

-- Fonts --
-- config.font = wezterm.font("Iosevka Nerd Font")
config.font = wezterm.font("JetBrainsMono Nerd Font")
-- config.font = wezterm.font("0xProto Nerd Font")
-- config.font = wezterm.font("BigBlueTermPlus Nerd Font")
-- config.font = wezterm.font("DepartureMono Nerd Font")
-- config.font = wezterm.font("ZedMono Nerd Font")
-- config.font = wezterm.font("MartianMono Nerd Font")
config.font_size = 15 -- 12, 13, 15
config.warn_about_missing_glyphs = false
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }

-- Tabs --
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = true
config.show_new_tab_button_in_tab_bar = false
config.show_tab_index_in_tab_bar = true
config.use_fancy_tab_bar = false
bar.apply_to_config(config, {
	position = "bottom",
	max_width = 32,
	padding = {
		left = 1,
		right = 1,
	},
	modules = {
		tabs = {
			active_tab_fg = 4,
			inactive_tab_fg = 6,
		},
		workspace = {
			enabled = true,
		},
		leader = {
			enabled = true,
		},
		pane = {
			enabled = true,
		},
		username = {
			enabled = false,
		},
		hostname = {
			enabled = false,
		},
		clock = {
			enabled = true,
		},
		cwd = {
			enabled = true,
		},
		spotify = {
			enabled = false,
		},
	},
})

-- Window --
config.initial_cols = 160
config.initial_rows = 40
config.window_padding = {
	left = "20px",
	right = "20px",
	top = "20px",
	bottom = "0px",
}
config.window_decorations = "RESIZE" -- "NONE", "TITLE", "RESIZE", "TITLE | RESIZE"
config.window_background_opacity = 1.00 -- 0.80, 0.90, 1.00
config.window_close_confirmation = "NeverPrompt" -- "NeverPrompt", "AlwaysPrompt"
config.keys = {
	-- Ignore <Ctrl- > default binds in Wezterm
	{
		key = "0",
		mods = "CTRL",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "-",
		mods = "CTRL",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "=",
		mods = "CTRL",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "0",
		mods = "SUPER",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "-",
		mods = "SUPER",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "=",
		mods = "SUPER",
		action = wezterm.action.DisableDefaultAssignment,
	},
}

-- MacOS Specific Configs --
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

return config
