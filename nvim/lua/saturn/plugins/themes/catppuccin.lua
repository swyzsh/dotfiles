return {
	{
		"catppuccin/nvim",
		lazy = false,
		priority = 1000,
		name = "catppuccin",
		config = function()
			require("catppuccin").setup({
				flavour = "mocha", -- latte, frappe, macchiato, mocha
				transparent_background = true,
				float = {
					transparent = true,
					solid = false, -- use solid styling for floating windows, see |winborder|
				},
				show_end_of_buffer = true,
				term_colors = true,
				dim_inactive = {
					enabled = false,
					shade = "dark",
					percentage = 0.15,
				},
				no_italic = false,
				no_bold = true,
				no_underline = false,
				styles = {
					comments = { "italic" },
					conditionals = { "italic" },
					loops = {},
					functions = { "italic" },
					keywords = {},
					strings = {},
					variables = {},
					numbers = {},
					booleans = {},
					properties = {},
					types = {},
					operators = {},
					-- miscs = {}, -- Uncomment to turn off hard-coded styles
				},
				color_overrides = {
					mocha = {},
				},
				custom_highlights = function(colors)
					return {
						-- Comment = { fg = colors.flamingo },
						CursorLineNr = { fg = colors.peach },
						-- CursorLineNr = { fg = colors.blue },
					}
				end,
				default_integrations = true,
				auto_integrations = false,
				integrations = {
					cmp = true,
					dropbar = {
						enabled = true,
						color_mode = true,
					},
					gitsigns = true,
					indent_blankline = { enabled = true },
					lsp_trouble = true,
					mason = true,
					markdown = true,
					mini = true,
					native_lsp = {
						enabled = true,
						underlines = {
							errors = { "undercurl" },
							hints = { "undercurl" },
							warnings = { "undercurl" },
							information = { "undercurl" },
						},
					},
					navic = { enabled = true, custom_bg = "lualine" },
					noice = true,
					notify = true,
					snacks = true,
					treesitter = true,
					treesitter_context = true,
					which_key = true,
				},
			})
		end,
	},
}
