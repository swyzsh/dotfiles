print("Welcome to SaturnVim!")

require("saturn.remap")

require("saturn.lazy")

----------------------- Colorschemes ---------------------------
vim.cmd.colorscheme("catppuccin")
-- vim.cmd.colorscheme("tokyonight")
-- vim.cmd.colorscheme("nightfox") -- Nightfox flavors: nightfox | dayfox | dawnfox | duskfox | nordfox | terafox | carbonfox
-- vim.cmd.colorscheme("gruvbox")
-- vim.cmd.colorscheme("github_dark")
-- vim.cmd.colorscheme("mellow")
-- vim.cmd.colorscheme("oldworld")
-- vim.cmd.colorscheme("vesper")
-- vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#FAA356" })
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" }) -- Manual background transparency if needed
----------------------------------------------------------------

vim.opt.number = true -- Enable absolute line numbers by default
-- Define an autocmd group for toggling relative line numbers
local numbertoggle_group = vim.api.nvim_create_augroup("numbertoggle", { clear = true })
-- Toggle relative line numbers when entering relevant modes
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "WinEnter" }, {
  group = numbertoggle_group,
  pattern = "*",
  callback = function()
    if vim.opt.number:get() and vim.fn.mode() ~= "i" then
      vim.opt.relativenumber = true
    end
  end,
})
-- Disable relative line numbers when leaving relative modes
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "WinLeave" }, {
  group = numbertoggle_group,
  pattern = "*",
  callback = function()
    if vim.opt.number:get() then
      vim.opt.relativenumber = false
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
    header = "",   -- Optional: Add a header
    -- prefix = "", -- Optional: Remove default prefix
  },
})

-- Global border for every floating window
vim.o.winborder = "rounded" -- Options: "single", "double", "rounded", "shadow"

vim.opt.tabstop = 2         -- Number of sapces that a tab represents
vim.opt.shiftwidth = 2      -- Number of spaces to use for each indentation level
vim.opt.expandtab = true    -- Use spaces instead of tabs
vim.opt.autoindent = true   -- Copy indent from current line when starting a new one

local rust_group = vim.api.nvim_create_augroup("RustSpecific", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = rust_group,
  pattern = "rust",
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
    vim.opt.autoindent = true
  end,
})

vim.opt.ignorecase = true -- Ignore case when searching
vim.opt.smartcase = true  -- Use case-sensitive if you include mixed case in your search

vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.background = "dark"       -- Preference for colorschemes that have both light & dark mode
vim.opt.signcolumn = "yes"        -- Show sign column so that text doesn't shift

vim.opt.splitright = true         -- Split vertical window to the right
vim.opt.splitbelow = true         -- Split horizontal window to the bottom

vim.opt.clipboard = "unnamedplus" -- Use system clipboard
vim.opt.swapfile = false          -- Turn off swapfile creation, not recommended / save often / use autosave

vim.opt.fillchars:append("eob:~") -- Show end of buffer

vim.opt.guicursor =
"n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250,sm:block-blinkwait175-blinkoff150-blinkon175"
