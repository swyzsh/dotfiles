return {
  "folke/snacks.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    { "echasnovski/mini.nvim", version = false },
  },
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    dashboard = {
      enabled = true,
      example = "advanced",
      preset = {
        header = [[
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠳⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⣀⡴⢧⣀⠀⠀⣀⣠⠤⠤⠤⠤⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠘⠏⢀⡴⠊⠁⠀⠀⠀⠀⠀⠀⠈⠙⠦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⣰⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢶⣶⣒⣶⠦⣤⣀⠀⠀
⠀⠀⠀⠀⠀⠀⢀⣰⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣟⠲⡌⠙⢦⠈⢧⠀
⠀⠀⠀⣠⢴⡾⢟⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⡴⢃⡠⠋⣠⠋⠀
⠐⠀⠞⣱⠋⢰⠁⢿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⠤⢖⣋⡥⢖⣫⠔⠋⠀⠀⠀
⠈⠠⡀⠹⢤⣈⣙⠚⠶⠤⠤⠤⠴⠶⣒⣒⣚⣩⠭⢵⣒⣻⠭⢖⠏⠁⢀⣀⠀⠀⠀⠀
⠠⠀⠈⠓⠒⠦⠭⠭⠭⣭⠭⠭⠭⠭⠿⠓⠒⠛⠉⠉⠀⠀⣠⠏⠀⠀⠘⠞⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠓⢤⣀⠀⠀⠀⠀⠀⠀⣀⡤⠞⠁⠀⣰⣆⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠘⠿⠀⠀⠀⠀⠀⠈⠉⠙⠒⠒⠛⠉⠁⠀⠀⠀⠉⢳⡞⠉⠀⠀⠀⠀⠀
]],
      },
      sections = {
        { section = "header" },
        { section = "keys", gap = 1, padding = 1 },
        { pane = 1, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { pane = 1, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        {
          pane = 1,
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
    explorer = {
      enabled = true,
      replace_netrw = true,
    },
    image = {
      enabled = false,
    },
    indent = { enabled = false },
    input = { enabled = true },
    picker = {
      enabled = true,
      hidden = true,
      ignored = true,
      sources = {
        explorer = {
          auto_close = false,
          diagnostics = false,
          git_status = true,
          show_empty = true,
          exclude = {
            "**/.DS_Store",
          },
          layout = {
            layout = {
              box = 'vertical',
              width = 36,
              border = 'none',
            }
          },
          win = {
            list = {
              wo = {
                relativenumber = false,
                numberwidth = 4,
              }
            }
          }
        },
        files = {
          hidden = true,
          exclude = {
            "**/.DS_Store",
          },
        }
      }
    },
    notifier = {
      enabled = true,
      timeout = 3000,
      style = "compact",
    },
    quickfile = { enabled = true },
    scroll = { enabled = false },
    statuscolumn = { enabled = true },
    ---@type table<string, snacks.win.Config>
    styles = {
      notification = {
        relative = "editor",
        border = "rounded",
        wo = {
          wrap = true,
          conceallevel = 2,
        },
      },
    },
    words = { enabled = false },
  },
  keys = {
    -- Top Pickers & Explorer --
    { "<leader><space>", function() Snacks.picker.smart() end,                                      desc = "Smart Find Files" },
    { "<leader>e",       function() Snacks.explorer() end,                                          desc = "File Explorer" },
    { "<leader>:",       function() Snacks.picker.command_history() end,                            desc = "Command History" },

    -- Buffer --
    { "<leader>bd",      function() Snacks.bufdelete() end,                                         desc = "Delete Buffer" },
    { "<S-w>",           function() Snacks.bufdelete() end,                                         desc = "Delete Buffer" },
    { "<leader>.",       function() Snacks.scratch() end,                                           desc = "Toggle Scratch Buffer" },

    -- Fuzzy Finder --
    { "<leader>/",       function() Snacks.picker.grep() end,                                       desc = "Grep" },
    { "<leader>fb",      function() Snacks.picker.buffers() end,                                    desc = "Buffers" },
    { "<leader>fc",      function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end,    desc = "Find Config File" },
    { "<leader>ff",      function() Snacks.picker.files() end,                                      desc = "Find Files" },
    { "<leader>fg",      function() Snacks.picker.git_files() end,                                  desc = "Find Git Files" },
    { "<leader>fp",      function() Snacks.picker.projects() end,                                   desc = "Projects" },
    { "<leader>fr",      function() Snacks.picker.recent() end,                                     desc = "Recent" },
    { "<leader>fs",      function() Snacks.picker.grep_word() end,                                  desc = "Visual selection or word", mode = { "n", "x" } },
    { "<leader>fh",      function() Snacks.picker.highlights({ pattern = "hl_group:^Snacks" }) end, desc = "Show Snacks Colors" },

    -- Reference Nav --
    { "]]",              function() Snacks.words.jump(vim.v.count1) end,                            desc = "Next Reference",           mode = { "n", "t" } },
    { "[[",              function() Snacks.words.jump(-vim.v.count1) end,                           desc = "Prev Reference",           mode = { "n", "t" } },

    -- Terminal --
    { "<c-`>",           function() Snacks.terminal() end,                                          desc = "Toggle Terminal" },

    -- Notification --
    { "<leader>n",       function() Snacks.notifier.show_history() end,                             desc = "Notification History" },

    -- Git --
    { "<leader>gg",      function() Snacks.lazygit() end,                                           desc = "Lazygit" },
    { "<leader>gb",      function() Snacks.git.blame_line() end,                                    desc = "Git Blame Line" },
    { "<leader>gB",      function() Snacks.gitbrowse() end,                                         desc = "Git Browse",               mode = { "n", "v" } },
    { "<leader>gf",      function() Snacks.picker.git_log_file() end,                               desc = "Git Log File" },
    { "<leader>gl",      function() Snacks.picker.git_log() end,                                    desc = "Git Log" },
    { "<leader>gL",      function() Snacks.picker.git_log_line() end,                               desc = "Git Log Line" },
    { "<leader>gs",      function() Snacks.picker.git_status() end,                                 desc = "Git Status" },
    { "<leader>gd",      function() Snacks.picker.git_diff() end,                                   desc = "Git Diff (Hunks)" },
  }
}
