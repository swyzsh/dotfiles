return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    on_attach = function(bufnr)
      require("saturn.remap").gitsigns_keymaps(bufnr)
    end,
  },
}
