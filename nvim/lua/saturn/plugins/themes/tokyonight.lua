return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    style = "night", -- storm | moon | night
    transparent = true,
    styles = {
      comments = { italic = true },
      keywords = {},
      functions = { italic = true },
      variables = {},
      -- Background styles. Can be "dark", "transparent" or "normal"
      sidebars = "transparent",
      floats = "transparent",
    },
  },
}
