print("Welcome to SaturnVim!")
require("saturn.remap")
require("saturn.lazy")
require("luasnip.loaders.from_vscode").lazy_load()

------------------------------- Colorschemes -----------------------------------
-- vim.cmd.colorscheme("catppuccin")
-- vim.cmd.colorscheme("rose-pine")
-- vim.cmd.colorscheme("tokyonight")
-- vim.cmd.colorscheme("duskfox") -- Nightfox flavors: nightfox | dayfox | dawnfox | duskfox | nordfox | terafox | carbonfox
-- vim.cmd.colorscheme("github_dark")
-- vim.cmd.colorscheme("oldworld")
-- vim.cmd.colorscheme("vesper")
-- vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#FAA356" })

--- Kanso ---
vim.cmd.colorscheme("kanso")
vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = "#393B44" })
vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#393B44" }) -- #393B44 | #5C6066
vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#393B44" })
-------------
--------------------------------------------------------------------------------

-- Toggle relative line numbers based on relevant modes
vim.opt.number = true -- default: absolute line numbers
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

---------------------------
-- Neovide Settings --
---------------------------

vim.g.neovide_refresh_rate = 165 -- match this to device limit
vim.g.neovide_remember_window_size = true
vim.g.neovide_show_border = true
vim.g.neovide_opacity = 1.0 -- default: 0.8
vim.g.neovide_window_blurred = false
vim.g.neovide_floating_blur_amount_x = 16.0 -- default: 2.0
vim.g.neovide_floating_blur_amount_y = 16.0 -- default: 2.0
vim.g.neovide_padding_top = 12
vim.g.neovide_padding_bottom = 6
vim.g.neovide_padding_right = 12
vim.g.neovide_padding_left = 12
vim.g.neovide_scroll_animation_length = 0.15 -- default: 0.3
vim.g.neovide_cursor_animation_length = 0.075 -- default: 0.150
vim.g.neovide_cursor_short_animation_length = 0.02 -- default: 0.04
vim.g.neovide_cursor_trail_size = 0.5 -- range: 0.0 to 1.0 | default: 1.0
vim.g.neovide_cursor_antialiasing = true
vim.g.neovide_cursor_animate_in_insert_mode = true
vim.g.neovide_cursor_animate_command_line = true
vim.g.neovide_cursor_vfx_mode = "" -- empty "", railgun, torpedo, pixiedust, sonicboom, ripple, wireframe
vim.g.neovide_profiler = false
vim.g.neovide_input_macos_option_key_is_meta = "only_left" -- "both", "only_left", "only_right", "none"
-- Fixes macos clipboard copy paste when using neovide
vim.g.neovide_input_use_logo = 1
if vim.g.neovide then
  vim.keymap.set("v", "<D-c>", '"+y') -- Copy
  vim.keymap.set({ "n", "v", "s", "x", "o", "i", "l", "c", "t" }, "<D-v>", function()
    vim.api.nvim_paste(vim.fn.getreg("+"), true, -1)
  end, { noremap = true, silent = true })
end

---------------------------
