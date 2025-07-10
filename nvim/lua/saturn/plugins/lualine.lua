return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VeryLazy",
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count
		local oldworld_p = require("oldworld.palette")

		lualine.setup({
			options = {
				-- theme = "auto", -- "auto" | "catppuccin"

				-- Oldworld (Modified) --
				theme = {
					normal = {
						a = { fg = oldworld_p.bg, bg = oldworld_p.red, gui = "bold" },
						b = { fg = oldworld_p.fg, bg = oldworld_p.gray2 },
						c = { fg = oldworld_p.fg, bg = oldworld_p.gray1 },
					},
					command = { a = { fg = oldworld_p.bg, bg = oldworld_p.yellow, gui = "bold" } },
					insert = { a = { fg = oldworld_p.bg, bg = oldworld_p.purple, gui = "bold" } },
					visual = { a = { fg = oldworld_p.bg, bg = oldworld_p.magenta, gui = "bold" } },
					terminal = { a = { fg = oldworld_p.bg, bg = oldworld_p.green, gui = "bold" } },
					replace = { a = { fg = oldworld_p.bg, bg = oldworld_p.orange, gui = "bold" } },
					inactive = {
						a = { fg = oldworld_p.subtext4, bg = oldworld_p.bg_dark, gui = "bold" },
						b = { fg = oldworld_p.subtext4, bg = oldworld_p.bg_dark },
						c = { fg = oldworld_p.subtext4, bg = oldworld_p.bg_dark },
					},
				},
			},

			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { { "filename", path = 1 } },
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#e6b99d" },
					},
					{ "encoding" },
					{ "fileformat" },
					{ "filetype" },
				},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		})
	end,
}
