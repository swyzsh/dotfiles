return {
	"projekt0n/github-nvim-theme",
	name = "github-theme",
	lazy = false,
	priority = 1000,
	config = function()
		require("github-theme").setup({
			options = {
				hide_end_of_buffer = false,
				transparent = false,
			},
		})

		vim.cmd("colorscheme github_dark")
	end,
}
