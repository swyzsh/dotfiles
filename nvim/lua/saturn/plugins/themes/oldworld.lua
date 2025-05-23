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
          CursorLineNr = { fg = "#F5A191" },
          FloatBorder = { fg = "#636369" }, -- defualt: #313134
        },
      })
    end,
  },
}
