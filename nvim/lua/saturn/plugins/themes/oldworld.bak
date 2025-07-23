return {
	{
		"dgox16/oldworld.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("oldworld").setup({
				variant = "default", -- default | oled | cooler
				styles = {
					comments = { italic = true },
					keywords = {},
					identifiers = {},
					functions = { italic = true },
					variables = {},
					booleans = {},
				},
				highlight_overrides = {
					Normal = { bg = "none" }, -- main text area
					NormalNC = { bg = "none" }, -- non-current/non-focused window
					NonText = { bg = "none" }, -- fill characters for empty lines
					SignColumn = { bg = "none" }, -- side column where linters/git signs are displayed
					StatusLine = { bg = "none" }, -- main status line at the bottom of the window
					StatusLineNC = { bg = "none", fg = "#6c6874" }, -- status line for non-current windows
					Pmenu = { bg = "none" }, -- popup menu for autocompletion, lsp def etc.
					NormalFloat = { bg = "none" }, -- normal floating windows like snacks' fzf
					ModeMsg = { fg = "#b4b1ba" },
					CursorLine = { bg = "#27272a" },
					CursorLineNr = { fg = "#e6b99d" },
					FloatBorder = { fg = "#62626a" },
					LineNr = { fg = "#62626a" },
				},
			})
		end,
	},
}
