return {
  {
    "dgox16/oldworld.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("oldworld").setup({
        variant = "default", -- default | oled | cooler
        styles = {
          comments = { italic = true },
          keywords = {},
          identifiers = {},
          functions = { italic = true },
          variables = {},
          booleans = {},
        },
        highlight_overrides = {
          CursorLineNr = { fg = "#e6b99d" },
          FloatBorder = { fg = "#62626a" },
          LineNr = { fg = "#62626a" },
          StatusLineNC = {
            fg = "#62626a",
          },
        },
      })
    end,
  },
}
