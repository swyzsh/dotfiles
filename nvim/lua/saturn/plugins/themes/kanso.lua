return {
  "webhooked/kanso.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("kanso").setup({
      bold = false, -- enable bold fonts
      italics = true, -- enable italics
      compile = false, -- enable compiling the colorscheme
      undercurl = true, -- enable undercurls
      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = { italic = true },
      statementStyle = {},
      typeStyle = {},
      transparent = false, -- do not set background color
      dimInactive = false, -- dim inactive window `:h hl-NormalNC`
      terminalColors = true, -- define vim.g.terminal_color_{0,17}
      colors = { -- add/modify theme and palette colors
        palette = {},
        theme = { zen = {}, pearl = {}, ink = {}, all = {} },
      },
      overrides = function(colors) -- add/modify highlights
        return {}
      end,
      theme = "zen", -- Load "zen" theme | Zen | Ink | Mist | Pearl
      background = { -- map the value of 'background' option to a theme
        dark = "zen", -- try "ink" !
        light = "pearl", -- try "mist" !
      },
    })
  end,
}
