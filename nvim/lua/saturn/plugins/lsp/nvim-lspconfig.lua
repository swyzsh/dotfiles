return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "mason-org/mason.nvim",
    "mason.nvim",
    { "mason-org/mason-lspconfig.nvim", config = function() end },
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")

    -- local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local capabilities = require("blink.cmp").get_lsp_capabilities()

    local server_configs = {
      lua_ls = {
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
      },
      cssls = {

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
      },
    }

    local function setup_server(server_name)
      local server_config =
        vim.tbl_deep_extend("force", { capabilities = capabilities }, server_configs[server_name] or {})

      lspconfig[server_name].setup(server_config)
    end

    mason_lspconfig.setup({
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
      },
      handlers = {
        -- Default handler for servers without custom config
        function(server_name)
          setup_server(server_name)
        end,
      },
    })

    local additional_servers = {}
    for _, server in ipairs(additional_servers) do
      setup_server(server)
    end
  end,
}
