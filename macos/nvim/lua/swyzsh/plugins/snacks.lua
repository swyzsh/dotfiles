return {
  "folke/snacks.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    { "echasnovski/mini.nvim", version = false, },
  },
  priority = 1000,
  lazy = false,
  opts = {
    dashboard = { 
      enabled = true, 
      example = "advanced",
      preset = {
        header =  [[
███████╗██╗    ██╗██╗   ██╗███████╗███████╗██╗  ██╗
██╔════╝██║    ██║╚██╗ ██╔╝╚══███╔╝██╔════╝██║  ██║
███████╗██║ █╗ ██║ ╚████╔╝   ███╔╝ ███████╗███████║
╚════██║██║███╗██║  ╚██╔╝   ███╔╝  ╚════██║██╔══██║
███████║╚███╔███╔╝   ██║   ███████╗███████║██║  ██║
╚══════╝ ╚══╝╚══╝    ╚═╝   ╚══════╝╚══════╝╚═╝  ╚═╝
]] 
        -- ASCII art font: ANSI Shadow | https://patorjk.com/software/taag/#p=display&c=lua&f=ANSI%20Shadow&t=SWYZSH
      }, 
      sections = {
        { section = "header" },
        {
          pane = 2,
          section = "terminal",
          cmd = "colorscript -e crunchbang-mini",
          height = 5,
          padding = 1,
        },
        { section = "keys", gap = 1, padding = 1 },
        { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        {
          pane = 2,
          icon = " ",
          title = "Git Status",
          section = "terminal",
          enabled = function()
            return Snacks.git.get_root() ~= nil
          end,
          cmd = "hub status --short --branch --renames",
          height = 5,
          padding = 1,
          ttl = 5 * 60,
          indent = 3,
        },
      { section = "startup" },
    },
    },
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    quickfile = { enabled = true },
    statuscolumn = { enabled = true },
    --words = { enabled = true }, -- Auto show LSP references
    styles = {
      notification = {
        wo = { wrap = true } -- Wrap notifcations
      },
    },
  },
  keys = {
    { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
    { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
    { "<leader>gb", function() Snacks.git.blame_line() end, desc = "Git Blame Line" },
    { "<leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browse" },
    { "<leader>gf", function() Snacks.lazygit.log_file() end, desc = "Lazygit Current File History" },
    { "<leader>gl", function() Snacks.lazygit.log() end, desc = "Lazygit Log (cwd)" },
    { "]]", function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
    { "[[", function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
  },
}
