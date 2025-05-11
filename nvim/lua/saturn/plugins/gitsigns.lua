return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    on_attach = function(bufnr)
      require("saturn.remaps.core").gitsigns_keymaps(bufnr)
    end,
  },
}
