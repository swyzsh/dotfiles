print("hello from swyzsh!")
require("swyzsh.remap")
require("swyzsh.lazy")

vim.opt.number = true -- Enable absolute line numbers by default

-- Define an autocmd group for toggling relative line numbers
local numbertoggle_group = vim.api.nvim_create_augroup("numbertoggle", { clear = true })

-- Toggle relative line numbers when entering relevant modes
vim.api.nvim_create_autocmd(
  { "BufEnter", "FocusGained", "InsertLeave", "WinEnter" },
  {
    group = numbertoggle_group,
    pattern = "*",
    callback = function()
      if vim.opt.number:get() and vim.fn.mode() ~= "i" then
        vim.opt.relativenumber = true
      end
    end
  }
)

-- Disable relative line numbers when leaving relative modes
vim.api.nvim_create_autocmd(
  { "BufLeave", "FocusLost", "InsertEnter", "WinLeave" },
  {
    group = numbertoggle_group,
    pattern = "*",
    callback = function()
      if vim.opt.number:get() then
        vim.opt.relativenumber = false
      end
    end,
  }
)


vim.opt.tabstop = 2       -- Number of sapces that a tab represents
vim.opt.shiftwidth = 2    -- Number of spaces to use for each indentation level
vim.opt.expandtab = true  -- Use spaces instead of tabs

vim.opt.clipboard = "unnamedplus"   -- use system clipboard
