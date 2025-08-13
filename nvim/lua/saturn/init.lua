print("Welcome to SaturnVim!")
require("saturn.remap")
require("saturn.lazy")

------------------------------- Colorschemes -----------------------------------
vim.cmd.colorscheme("catppuccin")
-- vim.cmd.colorscheme("rose-pine")
-- vim.cmd.colorscheme("tokyonight")
-- vim.cmd.colorscheme("duskfox") -- Nightfox flavors: nightfox | dayfox | dawnfox | duskfox | nordfox | terafox | carbonfox
-- vim.cmd.colorscheme("github_dark")
-- vim.cmd.colorscheme("oldworld")
-- vim.cmd.colorscheme("vesper")
-- vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#FAA356" })

--- Kanso ---
-- vim.cmd.colorscheme("kanso")
-- vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = "#393B44" })
-- vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#393B44" }) -- #393B44 | #5C6066
-- vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#393B44" })
-------------

--------------------------------------------------------------------------------

vim.opt.number = true -- Enable absolute line numbers by default
-- opt.relativenumber = true
-- Toggle relative line numbers based on relevant modes
local numbertoggle = vim.api.nvim_create_augroup("numbertoggle", {})
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "WinEnter" }, {
	group = numbertoggle,
	callback = function()
		if vim.opt.nu:get() and vim.api.nvim_get_mode() ~= "i" then
			vim.opt.relativenumber = true
		end
	end,
})
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "WinLeave" }, {
	group = numbertoggle,
	callback = function()
		if vim.opt.nu:get() then
			vim.opt.relativenumber = false
		end
	end,
})

vim.diagnostic.config({
	virtual_text = false, -- Enable/Disable Inline virtual text (annoying diagnostic besides code)
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.HINT] = "󰠠",
			[vim.diagnostic.severity.INFO] = "",
		},
	},
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		-- border = "rounded", -- Options: "single", "double", "rounded", "shadow"
		focusable = true,
		source = true, -- Show source of diagnostic
		header = "", -- Optional: Add a header
		-- prefix = "", -- Optional: Remove default prefix
	},
})

-- Global border for every floating window
vim.o.winborder = "rounded" -- Options: "single", "double", "rounded", "shadow"

vim.opt.tabstop = 2 -- Number of sapces that a tab represents
vim.opt.shiftwidth = 2 -- Number of spaces to use for each indentation level
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.autoindent = true -- Copy indent from current line when starting a new one

vim.opt.ignorecase = true -- Ignore case when searching
vim.opt.smartcase = true -- Use case-sensitive if you include mixed case in your search

vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.background = "dark" -- Preference for colorschemes that have both light & dark mode
vim.opt.signcolumn = "yes" -- Show sign column so that text doesn't shift

vim.opt.splitright = true -- Split vertical window to the right
vim.opt.splitbelow = true -- Split horizontal window to the bottom

vim.opt.clipboard = "unnamedplus" -- Use system clipboard
vim.opt.swapfile = false -- Turn off swapfile creation, not recommended / save often / use autosave

vim.opt.fillchars:append("eob:~") -- Show end of buffer

vim.opt.guicursor =
	"n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250,sm:block-blinkwait175-blinkoff150-blinkon175"

-- vim.g.neovide_opacity = 0.8
-- vim.g.neovide_window_blurred = true
-- -- vim.g.neovide_refresh_rate = 165
-- vim.g.neovide_remember_window_size = true
-- vim.g.neovide_show_border = true
-- vim.g.neovide_scroll_animation_length = 0.075
