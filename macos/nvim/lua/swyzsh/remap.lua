vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Nvim-Tree --
vim.keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
vim.keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file
vim.keymap.set("n", "<leader>ew", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
vim.keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer

-- Tabs --
vim.keymap.set("n", "<leader>tl", ":tabnext<CR>", { noremap = true, silent = true }) -- Go to next tab
vim.keymap.set("n", "<leader>th", ":tabprevious<CR>", { noremap = true, silent = true }) -- Go to previous tab
vim.keymap.set("n", "<leader>tw", ":tabclose<CR>", { noremap = true, silent = true }) -- Close the current tab
vim.keymap.set("n", "<leader>tn", ":tabnew<CR>", { noremap = true, silent = true }) -- Open a new tab
vim.keymap.set("n", "<leader>ta", ":tabonly<CR>", { noremap = true, silent = true }) -- Close all tabs except current one
vim.keymap.set("n", "<leader>tt", ":tabs<CR>", { noremap = true, silent = true }) -- List all tabs

-- Buffers --
vim.keymap.set("n", "<leader>bl", ":bnext<CR>", { noremap = true, silent = true }) -- Go to next buffer
vim.keymap.set("n", "<leader>bh", ":bprevious<CR>", { noremap = true, silent = true }) -- Go to previous buffer
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", { noremap = true, silent = true }) -- Delete buffer
vim.keymap.set("n", "<leader>bw", ":bwipeout<CR>", { noremap = true, silent = true }) -- Wipout buffer
vim.keymap.set("n", "<leader>bs", ":sbnext<CR>", { noremap = true, silent = true })  -- Split with next buffer
vim.keymap.set("n", "<leader>bb", ":buffers<CR>", { noremap = true, silent = true }) -- List all buffers

-- Telescope Fuzzy Finder--
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- Fuzzy find files in current working directory
vim.keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>") -- Fuzzy find recent files
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- Find string in current working directory
vim.keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- Find string under cursor in current working directory
vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>") -- Find todos
