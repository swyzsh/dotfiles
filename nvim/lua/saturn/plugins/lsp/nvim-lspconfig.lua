return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "mason-org/mason.nvim",
    "mason.nvim",
    { "mason-org/mason-lspconfig.nvim", config = function() end },
    "saghen/blink.cmp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    local mason_lspconfig = require("mason-lspconfig")
    local capabilities = require("blink.cmp").get_lsp_capabilities()

    local lspconfig = require("lspconfig").util.default_config
    lspconfig.capabilities = vim.tbl_deep_extend("force", lspconfig.capabilities, capabilities)

    mason_lspconfig.setup({
      ---@type string[]
      ensure_installed = {
        "bashls",
        "cssls",
        "docker_compose_language_service",
        "dockerls",
        -- "emmet_ls",
        "eslint",
        "html",
        -- "julials",
        "lua_ls",
        "marksman",
        -- "prismals",
        "pyright",
        "rust_analyzer",
        -- "solidity_ls_nomicfoundation",
        "tailwindcss",
        "vtsls",
        "yamlls",
      },

      ---@type boolean | string[] | { exclude: string[] }
      automatic_enable = {
        exclude = {},
      },
    })

    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          completion = {
            callSnippet = "Replace",
          },
        },
      },
    })

    vim.lsp.config("cssls", {
      capabilities = capabilities,
      settings = {
        css = {
          lint = {
            unknownAtRules = "ignore",
          },
        },
        scss = {
          lint = {
            unknownAtRules = "ignore",
          },
        },
        less = {
          lint = {
            unknownAtRules = "ignore",
          },
        },
      },
    })
  end,
}
