vim.g.mapleader = " "

-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)   -- Go back from anywhere to native neovim explorer

-- Window Management --
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split Window Vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split Window Horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make Splits Equal size" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close Current Split" })

-- Nvim-Tree --
vim.keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })
vim.keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle File Explorer on Current File" })
vim.keymap.set("n", "<leader>ew", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse File Explorer" })
vim.keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh File Explorer" })
vim.keymap.set("n", "<leader>ep", function()
  require("nvim-tree.api").tree.change_root(vim.loop.cwd())
  require("nvim-tree.api").tree.reload()
end, { desc = "Reset File Exporer to Project Root" })

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
vim.keymap.set("n", "<leader>bl", ":bnext<CR>", { noremap = true, silent = true, desc = "Next Buffer" })
vim.keymap.set("n", "<leader>bh", ":bprevious<CR>", { noremap = true, silent = true, desc = "Previous Buffer" })
-- vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", { noremap = true, silent = true }) -- Right now Using Snacks.bufdelete
vim.keymap.set("n", "<leader>bw", ":bwipeout<CR>", { noremap = true, silent = true, desc = "Wipeout Buffer" })
vim.keymap.set("n", "<leader>bs", ":sbnext<CR>", { noremap = true, silent = true, desc = "Split w/Next Buffer" })
vim.keymap.set("n", "<leader>bb", ":buffers<CR>", { noremap = true, silent = true, desc = "List All Buffers" })

-- Telescope Fuzzy Finder--
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files in CWD" })
vim.keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Find Recent Files" })
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find String in CWD" })
vim.keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find String Under Cursor" })
vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find Todos" })

-- hlsearch is built in vim use shift+3 "#" to search for anything under cursor or selected in file --
-- "n" moves backwards; shift+n moves forwards --
-- Following are keybinds to close hlsearch --
vim.keymap.set("n", "j", "j:nohlsearch<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "k", "k:nohlsearch<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "h", "h:nohlsearch<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "l", "l:nohlsearch<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "w", "w:nohlsearch<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "b", "b:nohlsearch<CR>", { noremap = true, silent = true })

local M = {}

-- Formatting --
M.formatting_keymaps = function()
  local conform = require("conform")
  vim.keymap.set({ "n", "v" }, "<leader>mp", function()
    conform.format({
      lsp_fallback = true,
      async = false,
      timeout_ms = 1000,
    })
  end, { desc = "Format file or range (in visual mode)" })
end

-- Git Signs --
M.gitsigns_keymaps = function(bufnr)
  local gs = package.loaded.gitsigns

  -- Navigation
  vim.keymap.set("n", "]h", gs.next_hunk, { buffer = bufnr, desc = "Next Hunk" })
  vim.keymap.set("n", "[h", gs.prev_hunk, { buffer = bufnr, desc = "Prev Hunk" })

  -- Actions
  vim.keymap.set("n", "<leader>hs", gs.stage_hunk, { buffer = bufnr, desc = "Stage Hunk" })
  vim.keymap.set("n", "<leader>hr", gs.reset_hunk, { buffer = bufnr, desc = "Reset Hunk" })
  vim.keymap.set("v", "<leader>hs", function()
    gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
  end, { buffer = bufnr, desc = "Stage Hunk (Visual)" })
  vim.keymap.set("v", "<leader>hr", function()
    gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
  end, { buffer = bufnr, desc = "Reset Hunk (Visual)" })

  vim.keymap.set("n", "<leader>hS", gs.stage_buffer, { buffer = bufnr, desc = "Stage Buffer" })
  vim.keymap.set("n", "<leader>hR", gs.reset_buffer, { buffer = bufnr, desc = "Reset Buffer" })
  vim.keymap.set("n", "<leader>hu", gs.undo_stage_hunk, { buffer = bufnr, desc = "Undo Stage Hunk" })

  vim.keymap.set("n", "<leader>hp", gs.preview_hunk, { buffer = bufnr, desc = "Preview Hunk" })

  vim.keymap.set("n", "<leader>hb", function()
    gs.blame_line({ full = true })
  end, { buffer = bufnr, desc = "Blame Line" })
  vim.keymap.set("n", "<leader>hB", gs.toggle_current_line_blame, { buffer = bufnr, desc = "Toggle Line Blame" })

  vim.keymap.set("n", "<leader>hd", gs.diffthis, { buffer = bufnr, desc = "Diff This" })
  vim.keymap.set("n", "<leader>hD", function()
    gs.diffthis("~")
  end, { buffer = bufnr, desc = "Diff This ~" })

  -- Text Object
  vim.keymap.set({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { buffer = bufnr, desc = "Select Hunk" })
end

-- LSP --
M.lsp_keymaps = function(bufnr)
  local opts = { buffer = bufnr, silent = true }

  vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", { desc = "Show LSP references", unpack(opts) })
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration", unpack(opts) })
  vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", { desc = "Show LSP definitions", unpack(opts) })
  vim.keymap.set(
    "n",
    "gi",
    "<cmd>Telescope lsp_implementations<CR>",
    { desc = "Show LSP implementations", unpack(opts) }
  )
  vim.keymap.set(
    "n",
    "gt",
    "<cmd>Telescope lsp_type_definitions<CR>",
    { desc = "Show LSP type definitions", unpack(opts) }
  )
  vim.keymap.set(
    { "n", "v" },
    "<leader>ca",
    vim.lsp.buf.code_action,
    { desc = "See available code actions", unpack(opts) }
  )
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Smart rename", unpack(opts) })
  vim.keymap.set(
    "n",
    "<leader>D",
    "<cmd>Telescope diagnostics bufnr=0<CR>",
    { desc = "Show buffer diagnostics", unpack(opts) }
  )
  vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show line diagnostics", unpack(opts) })
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic", unpack(opts) })
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic", unpack(opts) })
  vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show documentation for what is under cursor", unpack(opts) })
  vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", { desc = "Restart LSP", unpack(opts) })
end

return M
