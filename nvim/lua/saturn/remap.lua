vim.g.mapleader = " "

-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)   -- Go back from anywhere to native neovim explorer

vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr>", { desc = "Save file" })
vim.keymap.set({ "i", "x", "n", "s" }, "<D-s>", "<cmd>w<cr>", { desc = "Save file" })
-- vim.keymap.set("n", "<leader>w", "<cmd>w<cr><esc>", { desc = "Save file" })

-- Scrolling
vim.keymap.set({ "i", "x", "n", "s" }, "<C-e>", "3<C-e>")
vim.keymap.set({ "i", "x", "n", "s" }, "<C-y>", "3<C-y>")

-- Window Management --
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split Window Vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split Window Horizontally" })
vim.keymap.set("n", "<leader>s,", "<C-w><", { desc = "Decrease Split Width" })
vim.keymap.set("n", "<leader>s.", "<C-w>>", { desc = "Increase Split Width" })
vim.keymap.set("n", "<leader>s-", "<C-w>-", { desc = "Decrease Split Height" })
vim.keymap.set("n", "<leader>s=", "<C-w>+", { desc = "Increase Split Height" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make Splits Equal size" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close Current Split" })

-- Tabs --
vim.keymap.set("n", "<leader>tl", ":tabnext<CR>", { noremap = true, silent = true, desc = "Next Tab" })
vim.keymap.set("n", "<leader>th", ":tabprevious<CR>", { noremap = true, silent = true, desc = "Previous Tab" })
vim.keymap.set("n", "<leader>tw", ":tabclose<CR>", { noremap = true, silent = true, desc = "Delete Tab" })
vim.keymap.set("n", "<leader>tn", ":tabnew<CR>", { noremap = true, silent = true, desc = "New Tab" })
vim.keymap.set(
  "n",
  "<leader>ta",
  ":tabonly<CR>",
  { noremap = true, silent = true, desc = "Close All Tabs Except Current" }
)
vim.keymap.set("n", "<leader>tt", ":tabs<CR>", { noremap = true, silent = true, desc = "List All Tabs" })

-- Buffers --
vim.keymap.set("n", "<leader>b]", ":bnext<CR>", { noremap = true, silent = true, desc = "Next Buffer" })
vim.keymap.set("n", "<leader>b[", ":bprevious<CR>", { noremap = true, silent = true, desc = "Previous Buffer" })
vim.keymap.set("n", "<leader>bb", ":b#<CR>", { noremap = true, silent = true, desc = "Recent Buffer" })
-- vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", { noremap = true, silent = true }) -- Handled with plugins.snacks
-- vim.keymap.set("n", "<S-w>", ":bdelete<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>bw", ":bwipeout<CR>", { noremap = true, silent = true, desc = "Wipeout Buffer" })
vim.keymap.set("n", "<leader>bs", ":sbnext<CR>", { noremap = true, silent = true, desc = "Split w/Next Buffer" })
vim.keymap.set("n", "<leader>bl", ":buffers<CR>", { noremap = true, silent = true, desc = "List All Buffers" })
vim.keymap.set("n", "<TAB>", ":bnext<CR>", { noremap = true, silent = true, desc = " Cycle Buffers Forwards" })
vim.keymap.set(
  "n",
  "<S-TAB>",
  ":bprevious<CR>",
  { noremap = true, silent = true, desc = " Cycle Buffers Backwards" }
)

------------
-- Search --
------------
-- hlsearch is built in vim use shift+3 "#" to search for anything under cursor or selected in file
-- "n" moves backwards; shift+n moves forwards
-- Following keybind is shorthand for closing hlsearch
vim.keymap.set("n", "<Esc>", ":noh<CR>", { noremap = true, silent = true })

----------------
-- Formatting --
----------------
vim.keymap.set({ "n", "v" }, "<leader>mp", function()
  require("conform").format({
    lsp_fallback = true,
    async = false,
    timeout_ms = 1000,
  })
end, { desc = "Format file or range (in visual mode)" })
vim.keymap.set(
  "n",
  "<leader>ra",
  vim.lsp.buf.rename,
  { desc = " Rename ALL references to the symbol under the cursor for the ENTIRE project" }
)

-------------
-- Linting --
-------------
vim.keymap.set("n", "<leader>ll", function()
  require("lint").try_lint()
end, { desc = "Trigger linting for current file" })
vim.keymap.set("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "Next todo comment" })
vim.keymap.set("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

-----------------
-- Diagnostics --
-----------------
vim.keymap.set("n", "[d", function()
  vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Jump to previous diagnostic" })
vim.keymap.set("n", "]d", function()
  vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Jump to next diagnostic" })
vim.keymap.set("n", "<leader>dl", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
vim.keymap.set("n", "<C-i>", vim.diagnostic.open_float, { desc = "Show line diagnostics" })

------------------------------
-- Language Server Protocol --
------------------------------
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "See available code actions" })
-- <S-k> vim.lsp.buf.hover -> Show documentation for what is under cursor (default keybind)
vim.keymap.set("n", "<leader>lr", function()
  vim.cmd("LspRestart")
  vim.notify("Restarting all LSPs...", vim.log.levels.INFO, { title = "LSP" })
end, { desc = "Restart All LSPs" })
