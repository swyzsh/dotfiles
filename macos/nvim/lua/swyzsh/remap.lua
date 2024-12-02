vim.g.mapleader = " "

-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)   -- Go back from anywhere to native neovim explorer

-- Window Management --
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split Window Vertically" }) -- Split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split Window Horizontally" }) -- Split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make Splits Equal size" }) -- Make split windows equal width & height
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close Current Split" }) -- Close current split window

-- Nvim-Tree --
vim.keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle File Explorer" }) -- toggle file explorer
vim.keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle File Explorer on Current File" }) -- toggle file explorer on current file
vim.keymap.set("n", "<leader>ew", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse File Explorer" }) -- collapse file explorer
vim.keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh File Explorer" }) -- refresh file explorer

-- Tabs --
vim.keymap.set("n", "<leader>tl", ":tabnext<CR>", { noremap = true, silent = true }) -- Go to next tab
vim.keymap.set("n", "<leader>th", ":tabprevious<CR>", { noremap = true, silent = true }) -- Go to previous tab
vim.keymap.set("n", "<leader>tw", ":tabclose<CR>", { noremap = true, silent = true }) -- Close the current tab
vim.keymap.set("n", "<leader>tn", ":tabnew<CR>", { noremap = true, silent = true }) -- Open a new tab
vim.keymap.set("n", "<leader>ta", ":tabonly<CR>", { noremap = true, silent = true }) -- Close all tabs except current one
vim.keymap.set("n", "<leader>tt", ":tabs<CR>", { noremap = true, silent = true }) -- List all tabs

-- Buffers --
vim.keymap.set("n", "<leader>bl", ":bnext<CR>", { noremap = true, silent = true, desc = "Next Buffer" }) -- Go to next buffer
vim.keymap.set("n", "<leader>bh", ":bprevious<CR>", { noremap = true, silent = true, desc = "Previous Buffer" }) -- Go to previous buffer
-- vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", { noremap = true, silent = true }) -- Delete buffer (Using alt Snacks.bufdelete)
vim.keymap.set("n", "<leader>bw", ":bwipeout<CR>", { noremap = true, silent = true, desc = "Wipeout Buffer" }) -- Wipout buffer
vim.keymap.set("n", "<leader>bs", ":sbnext<CR>", { noremap = true, silent = true, desc = "Split w/Next Buffer" }) -- Split with next buffer
vim.keymap.set("n", "<leader>bb", ":buffers<CR>", { noremap = true, silent = true, desc = "List All Buffers" }) -- List all buffers

-- Telescope Fuzzy Finder--
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files in CWD" }) -- Fuzzy find files in current working directory
vim.keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Find Recent Files" }) -- Fuzzy find recent files
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find String in CWD" }) -- Find string in current working directory
vim.keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find String Under Cursor" }) -- Find string under cursor in current working directory
vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find Todos" }) -- Find todos

-- hlsearch is built in vim use shift+3 "#" to search for anything under cursor or selected in file --
-- "n" moves backwards; shift+n moves forwards --
-- Following are keybinds to close hlsearch --
vim.keymap.set("n", "j", "j:nohlsearch<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "k", "k:nohlsearch<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "h", "h:nohlsearch<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "l", "l:nohlsearch<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "w", "w:nohlsearch<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "b", "b:nohlsearch<CR>", { noremap = true, silent = true })
