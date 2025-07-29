return {
	{
		"echasnovski/mini.icons",
		event = "VeryLazy",
		version = false,
		opts = {
			style = "glyph",
		},
		lazy = true,
		specs = {
			{ "nvim-tree/nvim-web-devicons", enabled = true, optional = true },
		},
		init = function()
			package.preload["nvim-web-devicons"] = function()
				require("mini.icons").mock_nvim_web_devicons()
				return package.loaded["nvim-web-devicons"]
			end
		end,
		config = function(_, opts)
			require("mini.icons").setup(opts) -- Call setup() with options
		end,
	},
}
