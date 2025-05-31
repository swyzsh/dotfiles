return {
	{
		"EdenEast/nightfox.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("nightfox").setup({
				options = {
					transparent = true,
					styles = {
						comments = "italic", -- Value is any valid attr-list value `:help attr-list`
						conditionals = "italic",
						constants = "NONE",
						functions = "italic",
						keywords = "NONE",
						numbers = "NONE",
						operators = "NONE",
						strings = "NONE",
						types = "NONE",
						variables = "NONE",
					},
				},
			})
		end,
	},
}
