return {
  "folke/which-key.nvim",
  dependencies = {
    { "echasnovski/mini.icons", version = false },
  },
  event = "VeryLazy",
  opts = {
    preset = "helix",
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
  -- Icons that are recognized by text inside a group name:
  -- IF THE Parent group has a icon like this, its child has them too unless specified by another text
  -- File
  -- Buffer
  -- Diagnostics
  -- Git
  -- Search
  -- Toggle
  -- Debug
  -- Format
  -- Code
  -- Colors can be added by `icon = { icon = "", color = "" }`
  -- Valid colors are: azure, blue, cyan, green, grey, orange, purple, red, and yellow
  config = function(_, opts)
    local wk = require("which-key")

    wk.add({
      { "<leader>b", icon = "", group = "Buffers" },
      { "<leader>bb", icon = "  ", group = " Recent buffer" },
      { "<leader>bl", icon = "  ", group = " List all buffers" },
      { "<leader>bd", icon = " 󰗨 ", group = " Delete buffer" },
      { "<leader>b[", icon = "  ", group = " Previous buffer" },
      { "<leader>b]", icon = "  ", group = " Next buffer" },
      { "<leader>bs", icon = "  ", group = " Split w/ next buffer" },
      { "<leader>bw", icon = "  ", group = " Wipeout buffer" },

      { "<leader>t", icon = "󰓩", group = "Tabs" },

      { "<leader>d", icon = { icon = "", color = "azure" }, group = "Diagnostics" },
      { "<leader>dw", icon = { icon = " 󰈔", color = "azure" }, group = "Workspace diagnostics" },
      { "<leader>db", icon = { icon = " ", color = "azure" }, group = "Buffer diagnostics" },
      { "<leader>dl", icon = { icon = " ", color = "azure" }, group = "Line diagnostics" },

      { "<leader>e", icon = { icon = "󰙅", color = "azure" }, group = "File explorer (dir of current file)" },
      { "<leader>E", icon = { icon = "󰙅", color = "cyan" }, group = "File explorer (cwd)" },

      { "<leader>/", icon = "", group = "Grep" },
      { "<leader><leader>", icon = "", group = "Smart Find Files" },
      { "<leader>f", icon = { icon = "", color = "green" }, group = "Fuzzy Find" },
      { "<leader>fb", icon = { icon = " ", color = "green" }, group = "Find Buffers" },
      { "<leader>fc", icon = { icon = " ", color = "green" }, group = "Find Config Files" },
      { "<leader>ff", icon = { icon = " ", color = "green" }, group = "Find Files" },
      { "<leader>fg", icon = { icon = " ", color = "green" }, group = "Find Git Files" },
      { "<leader>fr", icon = { icon = " 󰈔", color = "green" }, group = "Find Recent Files" },
      { "<leader>fs", icon = { icon = " ", color = "green" }, group = "Visual selection or word" },
      { "<leader>ft", icon = { icon = " ", color = "green" }, group = "Find Todos" },
      -- TODO: Complete find icons

      { "<leader>g", icon = { icon = "", color = "orange" }, group = "Git" },
      -- TODO: Complete git icons
      -- TODO: Add rest of the colors for icons

      { "<leader>l", icon = "", group = "LSPs & Linting" },
      { "<leader>ll", icon = " ", group = "Trigger linting for current file" },
      { "<leader>lr", icon = " ", group = "Restart All LSPs" },

      { "<leader>m", icon = { icon = "󰛖", color = "red" }, group = "Formatting" },
      { "<leader>mp", icon = { icon = "󰛖 󰈔", color = "red" }, group = "Format file or range (in visual mode)" },

      { "<leader>r", icon = "󰑕", group = "Rename" },
      -- { "<leader>rn", icon = "󰑕 ", group = "Smart rename" },

      { "<leader>q", icon = "", group = "Session Manager" },
      { "<leader>qd", icon = " ", group = "Don't save current session" },
      { "<leader>ql", icon = " 󰦛", group = "Restore last session" },
      { "<leader>qs", icon = " 󰦛", group = "Restore session" },
      { "<leader>qS", icon = " ", group = "Select session" },

      { "<leader>s", icon = "󰯌", group = "Split Windows" },
      { "<leader>se", icon = "󰯌 󱤗", group = "Make splits equal size" },
      { "<leader>sh", icon = "󰯌 ", group = "Split window horizontally" },
      { "<leader>sv", icon = "󰯌 ", group = "Split window vertically" },
      { "<leader>sx", icon = "󰯌 ", group = "Close active split" },

      { "<leader>[t", icon = " ", group = "Previous todo comment" },
      { "<leader>]t", icon = " ", group = "Next todo comment" },

      { "<leader>u", icon = { icon = "󰉼", color = "purple" }, group = "UI Toggles" },

      { "gs", icon = { icon = "", color = "azure" }, group = "Surround" },
    })

    wk.setup(opts)
  end,
}
