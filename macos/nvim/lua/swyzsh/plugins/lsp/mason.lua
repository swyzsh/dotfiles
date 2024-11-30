return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    local mason_tool_installer = require("mason-tool-installer")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        "bashls", -- Bash
        "lua_ls", -- Lua
        "marksman", -- Markdown
        --"rnix",                             -- Nix
        "html", -- HTML
        "cssls", -- CSS
        "eslint", -- Javascript
        "tailwindcss", -- Tailwind
        "angularls", -- Angular JS
        "svelte", -- Svelte
        "graphql", -- GraphQL
        "emmet_ls", -- JSX/TSX
        "prismals", -- Prisma
        "pyright", -- Python
        "rust_analyzer", -- Rust
        "solidity_ls_nomicfoundation", -- Solidity
        "docker_compose_language_service", -- Docker
        "dockerls", -- Docker
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "prettier", -- prettier formatter
        "stylua", -- lua formatter
        "isort", -- python formatter
        "black", -- python formatter
        "pylint",
        "eslint_d",
      },
    })
  end,
}
