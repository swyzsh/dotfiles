return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim",                   opts = {} },
  },
  config = function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local capabilities = cmp_nvim_lsp.default_capabilities()

    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(event)
        local remap = require("saturn.remap")
        remap.lsp_keymaps(event.buf)
      end,
    })

    lspconfig.ts_ls.setup({
      capabilities = capabilities,
      filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    })

    local function has_eslint_config(root_dir)
      local config_files = {
        ".eslintrc.js",
        ".eslintrc.cjs",
        ".eslintrc.json",
        ".eslintrc.yaml",
        ".eslintrc.yml",
        "eslint.config.js",
        "eslint.config.mjs",
        "eslint.config.cjs",
        "eslint.config.ts",
        "eslint.config.mts",
        "eslint.config.cts",
      }

      -- Check for config files
      for _, config in ipairs(config_files) do
        if vim.fn.filereadable(root_dir .. "/" .. config) == 1 then
          return true
        end
      end

      -- Check package.json for eslintConfig
      local pkg_json = root_dir .. "/package.json"
      if vim.fn.filereadable(pkg_json) == 1 then
        local ok, content = pcall(vim.fn.readfile, pkg_json)
        if ok and content then
          local json_str = table.concat(content, "")
          local ok_decode, json = pcall(vim.fn.json_decode, json_str)
          if ok_decode and json and json.eslintConfig then
            return true
          end
        end
      end

      return false
    end

    local eslint_root = lspconfig.util.root_pattern(
      ".eslintrc.js",
      ".eslintrc.cjs",
      ".eslintrc.json",
      ".eslintrc.yaml",
      ".eslintrc.yml",
      "eslint.config.js",
      "eslint.config.mjs",
      "eslint.config.cjs",
      "eslint.config.ts",
      "eslint.config.mts",
      "eslint.config.cts",
      "package.json"
    )

    lspconfig.eslint.setup({
      capabilities = capabilities,
      on_attach = function(_, bufnr)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lx", "<cmd>EslintFixAll<CR>", { silent = true })
      end,
      root_dir = function(fname)
        local root = eslint_root(fname)
        if root and has_eslint_config(root) then
          return root
        end
        return nil -- disable eslint if no config found
      end,
      settings = {
        format = { enable = true },
        validate = "on",
        packageManager = "npm",
        useESLintClass = false,
        experimental = {
          useFlatConfig = false
        },
        codeActionOnSave = {
          enable = false,
          mode = "all"
        },
        run = "onType",
        nodePath = "",
      },
    })

    lspconfig.graphql.setup({
      capabilities = capabilities,
      filetypes = { "graphql", "gql", "typescriptreact", "javascriptreact" },
    })

    lspconfig.emmet_ls.setup({
      capabilities = capabilities,
      filetypes = { "html", "css", "sass", "scss", "less" },
    })

    lspconfig.lua_ls.setup({
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


    -- Additional servers with basic setup
    local servers = {
      "bashls",
      "cssls",
      "docker_compose_language_service",
      "dockerls",
      "html",
      "marksman",
      "prismals",
      "pyright",
      "solidity_ls_nomicfoundation",
      "tailwindcss",
    }

    for _, server in ipairs(servers) do
      lspconfig[server].setup({
        capabilities = capabilities,
      })
    end
  end,
}
