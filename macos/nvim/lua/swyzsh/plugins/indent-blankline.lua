return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPre", "BufNewFile" },
  main = "ibl",
  opts = function()
    Snacks.toggle({
      name = "Indention Guides",
      get = function()
        return require("ibl.config").get_config(0).enabled
      end,
      set = function(state)
        require("ibl").setup_buffer(0, { enabled = state })
      end,
    }):map("<leader>ug")

    local hooks = require("ibl.hooks")
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      -- vim.api.nvim_set_hl(0, "IndentBlanklineScope", { fg = "#89b4fa" })
      -- vim.api.nvim_set_hl(0, "IndentBlanklineScope", { fg = "#ff9e64" })
      vim.api.nvim_set_hl(0, "IndentBlanklineScope", { fg = "#bb9af7" })
      vim.api.nvim_set_hl(0, "IndentBlanklinePassive", { fg = "#585b70" })
    end)

    return {
      scope = {
        show_start = false,
        show_end = false,
        highlight = "IndentBlanklineScope",
      },
      indent = {
        -- char = "│",
        -- tab_char = "│",
        char = "┊",
        tab_char = "┊",
        highlight = "IndentBlanklinePassive",
      },
      exclude = {
        filetypes = {
          "Trouble",
          "alpha",
          "dashboard",
          "help",
          "lazy",
          "mason",
          "neo-tree",
          "notify",
          "snacks_dashboard",
          "snacks_notif",
          "snacks_terminal",
          "snacks_win",
          "toggleterm",
          "trouble",
        },
      },
    }
  end,
}
