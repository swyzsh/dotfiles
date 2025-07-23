print("Welcome to SaturnVim!")

require("saturn.remap")

require("saturn.lazy")

local cmd = vim.cmd
local api = vim.api
local opt = vim.opt

----------------------- Colorschemes ---------------------------

-- cmd.colorscheme("catppuccin")
-- cmd.colorscheme("rose-pine")
-- cmd.colorscheme("tokyonight")
-- cmd.colorscheme("duskfox") -- Nightfox flavors: nightfox | dayfox | dawnfox | duskfox | nordfox | terafox | carbonfox
-- cmd.colorscheme("github_dark")
-- cmd.colorscheme("oldworld")
-- cmd.colorscheme("vesper")
-- api.nvim_set_hl(0, "CursorLineNr", { fg = "#FAA356" })

--- Kanso ---
cmd.colorscheme("kanso")
api.nvim_set_hl(0, "EndOfBuffer", { fg = "#393B44" })
api.nvim_set_hl(0, "FloatBorder", { fg = "#393B44" }) -- #393B44 | #5C6066
api.nvim_set_hl(0, "WinSeparator", { fg = "#393B44" })
-------------

----------------------------------------------------------------

opt.number = true -- Enable absolute line numbers by default
-- Define an autocmd group for toggling relative line numbers
local numbertoggle_group = api.nvim_create_augroup("numbertoggle", { clear = true })
-- Toggle relative line numbers when entering relevant modes
api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "WinEnter" }, {
	group = numbertoggle_group,
	pattern = "*",
	callback = function()
		if opt.number:get() and vim.fn.mode() ~= "i" then
			opt.relativenumber = true
		end
	end,
})
-- Disable relative line numbers when leaving relative modes
api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "WinLeave" }, {
	group = numbertoggle_group,
	pattern = "*",
	callback = function()
		if opt.number:get() then
			opt.relativenumber = false
		end
	end,
})

vim.diagnostic.config({
	virtual_text = false, -- Enable/Disable Inline virtual text (annoying diagnostic besides code)
	signs = true,
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

opt.tabstop = 2 -- Number of sapces that a tab represents
opt.shiftwidth = 2 -- Number of spaces to use for each indentation level
opt.expandtab = true -- Use spaces instead of tabs
opt.autoindent = true -- Copy indent from current line when starting a new one

opt.ignorecase = true -- Ignore case when searching
opt.smartcase = true -- Use case-sensitive if you include mixed case in your search

opt.cursorline = true
opt.termguicolors = true
opt.background = "dark" -- Preference for colorschemes that have both light & dark mode
opt.signcolumn = "yes" -- Show sign column so that text doesn't shift

opt.splitright = true -- Split vertical window to the right
opt.splitbelow = true -- Split horizontal window to the bottom

opt.clipboard = "unnamedplus" -- Use system clipboard
opt.swapfile = false -- Turn off swapfile creation, not recommended / save often / use autosave

opt.fillchars:append("eob:~") -- Show end of buffer

opt.guicursor =
	"n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250,sm:block-blinkwait175-blinkoff150-blinkon175"
