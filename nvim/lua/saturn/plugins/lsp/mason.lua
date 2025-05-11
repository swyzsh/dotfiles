return {
  "mason-org/mason.nvim",
  "mason-org/mason-lspconfig.nvim",

  config = function()
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    require("mason-lspconfig").setup({
      ensure_installed = {
        "bashls",
        "cssls",
        "docker_compose_language_service",
        "dockerls",
        "emmet_ls",
        "eslint",
        "graphql",
        "html",
        "lua_ls",
        "marksman",
        "prismals",
        "pyright",
        "rust_analyzer",
        "solidity_ls_nomicfoundation",
        "tailwindcss",
        "ts_ls",
      },
      automatic_enable = {
        excluse = { "eslint" },
      },
    })
  end,
}
