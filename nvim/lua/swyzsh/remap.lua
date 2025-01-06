vim.g.mapleader = " "

-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)   -- Go back from anywhere to native neovim explorer

vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr>", { desc = "Save file" })
vim.keymap.set("n", "<leader>w", "<cmd>w<cr><esc>", { desc = "Save file" })

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
vim.keymap.set("n", "<TAB>", ":bnext<CR>", { noremap = true, silent = true, desc = " Cycle Buffers Forwards" })
vim.keymap.set(
  "n",
  "<S-TAB>",
  ":bprevious<CR>",
  { noremap = true, silent = true, desc = " Cycle Buffers Backwards" }
)

-- Terminal

local terminal_buf = nil

-- Terminal: Toggle terminal
vim.keymap.set("n", "<leader>xx", function()
  -- Check if the terminal buffer exists and is valid
  if terminal_buf and vim.api.nvim_buf_is_valid(terminal_buf) then
    -- Check if the terminal is currently open in a window
    for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
      if vim.api.nvim_win_get_buf(win) == terminal_buf then
        vim.api.nvim_win_close(win, true) -- Close terminal window
        vim.api.nvim_buf_delete(terminal_buf, { force = true }) -- Delete terminal buffer
        terminal_buf = nil -- Reset terminal buffer variable
        vim.notify("Terminal exited!")
        return
      end
    end
    -- If not open, reopen it in a split
    vim.cmd("20split")
    vim.api.nvim_set_current_buf(terminal_buf)
    vim.notify("Terminal reopened!")
  else
    -- Create a new terminal buffer if it doesn't exist
    vim.cmd("20split | terminal")
    terminal_buf = vim.api.nvim_get_current_buf()

    -- Set the terminal buffer as a scratch buffer (not listed in bufferline)
    vim.bo[terminal_buf].bufhidden = "hide"
    vim.bo[terminal_buf].buftype = "terminal"
    vim.notify("Terminal opened!")
  end
end, { noremap = true, silent = true, desc = "Toggle terminal" })

-- Terminal: Hide terminal
vim.keymap.set("n", "<leader>xh", function()
  if terminal_buf and vim.api.nvim_buf_is_valid(terminal_buf) then
    for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
      if vim.api.nvim_win_get_buf(win) == terminal_buf then
        vim.api.nvim_win_hide(win) -- Hide terminal window
        vim.notify("Terminal hidden!")
        return
      end
    end
  end
end, { noremap = true, silent = true, desc = "Hide terminal" })

-- Terminal: Exit terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true, desc = "Exit terminal mode with ESC" })

-- Terminal: Navigation
vim.keymap.set("t", "<C-w>h", "<C-\\><C-n><C-w>h", { noremap = true, silent = true, desc = "Move to left window" })
vim.keymap.set("t", "<C-w>j", "<C-\\><C-n><C-w>j", { noremap = true, silent = true, desc = "Move to below window" })
vim.keymap.set("t", "<C-w>k", "<C-\\><C-n><C-w>k", { noremap = true, silent = true, desc = "Move to above window" })
vim.keymap.set("t", "<C-w>l", "<C-\\><C-n><C-w>l", { noremap = true, silent = true, desc = "Move to right window" })

-- Terminal: Close terminal in terminal mode
vim.keymap.set("t", "<leader>xx", function()
  if terminal_buf and vim.api.nvim_buf_is_valid(terminal_buf) then
    vim.api.nvim_buf_delete(terminal_buf, { force = true }) -- Delete terminal buffer
    terminal_buf = nil -- Reset terminal buffer variable
    vim.notify("Terminal closed")
  end
end, { noremap = true, silent = true, desc = "Close terminal" })

-- Terminal: Hide terminal in terminal mode
vim.keymap.set("t", "<leader>xh", function()
  local win = vim.api.nvim_get_current_win()
  if terminal_buf and vim.api.nvim_win_get_buf(win) == terminal_buf then
    vim.api.nvim_win_hide(win) -- Hide terminal window
    vim.notify("Terminal hidden")
  end
end, { noremap = true, silent = true, desc = "Hide terminal" })

-- Trouble
vim.keymap.set("n", "<leader>xw", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Trouble: Workspace diagnostics" })
vim.keymap.set(
  "n",
  "<leader>xd",
  "<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
  { desc = "Trouble: Document diagnostics" }
)
vim.keymap.set("n", "<leader>xq", "<cmd>Trouble quickfix toggle<CR>", { desc = "Trouble: Quickfix list" })
vim.keymap.set("n", "<leader>xl", "<cmd>Trouble loclist toggle<CR>", { desc = "Trouble: Location list" })
vim.keymap.set("n", "<leader>xt", "<cmd>Trouble todo toggle<CR>", { desc = "Trouble: Todos in Trouble" })

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

-- Linting
vim.keymap.set("n", "<leader>ll", function()
  require("lint").try_lint()
end, { desc = "Trigger linting for current file" })

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
    "<leader>db",
    "<cmd>Telescope diagnostics bufnr=0<CR>",
    { desc = "Show buffer diagnostics", unpack(opts) }
  )
  vim.keymap.set("n", "<leader>dl", vim.diagnostic.open_float, { desc = "Show line diagnostics", unpack(opts) })
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic", unpack(opts) })
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic", unpack(opts) })
  vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show documentation for what is under cursor", unpack(opts) })
  vim.keymap.set("n", "<leader>lr", ":LspRestart<CR>", { desc = "Restart All LSPs", unpack(opts) })
end

-- Toggle Individual LSPs
local lsp_clients = {
  -- First set
  [1] = {
    "bashls",
    "cssls",
    "docker_compose_language_service",
    "dockerls",
    "emmet_ls",
    "eslint",
    "graphql",
    "html",
    "lua_ls",
  },
  -- Second set
  [2] = {
    "marksman",
    "prismals",
    "pyright",
    "rust_analyzer",
    "solidity_ls_nomicfoundation",
    "tailwindcss",
    "ts_ls",
  },
}

local function toggle_lsp(client_name)
  local clients = vim.lsp.get_clients()
  for _, client in ipairs(clients) do
    if client.name == client_name then
      client.stop()
      vim.notify("LSP [" .. client_name .. "] stopped.")
      return
    end
  end

  -- Check if configuration exists
  local config = require("lspconfig")[client_name]
  if not config then
    vim.notify("LSP [" .. client_name .. "] configuration not found!", vim.log.levels.ERROR)
    return
  end

  -- Validate LSP-specific conditions
  local root_dir = vim.fn.getcwd() -- Example root directory check
  if client_name == "rust_analyzer" and vim.fn.filereadable(root_dir .. "/Cargo.toml") == 0 then
    vim.notify("LSP [rust_analyzer] requires Cargo.toml in the project root.", vim.log.levels.WARN)
    return
  elseif client_name == "eslint" and vim.fn.filereadable(root_dir .. "/.eslintrc*") == 0 then
    vim.notify("LSP [eslint] requires an ESLint config file in the project root.", vim.log.levels.WARN)
    return
  end

  -- Start the LSP
  local client_id = vim.lsp.start_client(vim.lsp.get_config(client_name))
  if client_id then
    vim.notify("LSP [" .. client_name .. "] started.")
  else
    vim.notify("Failed to start LSP [" .. client_name .. "]", vim.log.levels.ERROR)
  end
end

local function toggle_all_lsps()
  local clients = vim.lsp.get_clients()
  if #clients > 0 then
    for _, client in ipairs(clients) do
      client.stop()
    end
    vim.notify("All LSPs stopped.")
  else
    -- Start all configured LSP servers
    for _, client_list in ipairs(lsp_clients) do
      for _, client_name in ipairs(client_list) do
        local config = require("lspconfig")[client_name]
        if not config then
          vim.notify("LSP [" .. client_name .. "] configuration not found!", vim.log.levels.ERROR)
        else
          -- Perform validation for specific LSPs
          local root_dir = vim.fn.getcwd()
          if client_name == "rust_analyzer" and vim.fn.filereadable(root_dir .. "/Cargo.toml") == 0 then
            vim.notify("LSP [rust_analyzer] requires Cargo.toml in the project root.", vim.log.levels.WARN)
          elseif client_name == "eslint" and vim.fn.filereadable(root_dir .. "/.eslintrc*") == 0 then
            vim.notify("LSP [eslint] requires an ESLint config file in the project root.", vim.log.levels.WARN)
          else
            -- Start the client
            local client_id = vim.lsp.start_client(config)
            if client_id then
              vim.notify("LSP [" .. client_name .. "] started.")
            else
              vim.notify("Failed to start LSP [" .. client_name .. "]", vim.log.levels.ERROR)
            end
          end
        end
      end
    end
    vim.cmd("e") -- Reload buffers to attach clients
    vim.notify("All LSPs started.")
  end
end

-- Add key mappings for toggling LSPs
for set_id, clients in pairs(lsp_clients) do
  for index, client_name in ipairs(clients) do
    vim.keymap.set("n", "<leader>l" .. set_id .. index, function()
      toggle_lsp(client_name)
    end, { desc = "Toggle LSP: " .. client_name })
  end
end

-- Toggle all LSPs
vim.keymap.set("n", "<leader>la", toggle_all_lsps, { desc = "Toggle All LSPs" })

-- Snacks --
M.snacks_keymaps = function()
  local Snacks = require("snacks")

  vim.keymap.set("n", "<leader>bd", function()
    Snacks.bufdelete()
  end, { desc = "Delete Buffer" })

  -- Lazygit
  vim.keymap.set("n", "<leader>gg", function()
    Snacks.lazygit()
  end, { desc = "Lazygit" })

  -- Git Blame
  vim.keymap.set("n", "<leader>gb", function()
    Snacks.git.blame_line()
  end, { desc = "Git Blame Line" })

  -- Git Browse
  vim.keymap.set("n", "<leader>gB", function()
    Snacks.gitbrowse()
  end, { desc = "Git Browse" })

  -- Lazygit File History
  vim.keymap.set("n", "<leader>gf", function()
    Snacks.lazygit.log_file()
  end, { desc = "Lazygit Current File History" })

  -- Lazygit Log (cwd)
  vim.keymap.set("n", "<leader>gl", function()
    Snacks.lazygit.log()
  end, { desc = "Lazygit Log (cwd)" })

  -- Reference Navigation
  vim.keymap.set({ "n", "t" }, "]]", function()
    Snacks.words.jump(vim.v.count1)
  end, { desc = "Next Reference" })

  vim.keymap.set({ "n", "t" }, "[[", function()
    Snacks.words.jump(-vim.v.count1)
  end, { desc = "Previous Reference" })
end

return M
