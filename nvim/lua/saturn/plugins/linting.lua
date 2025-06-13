return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      svelte = { "eslint_d" },
      python = { "pylint" },
    }

    local function has_eslint_config()
      local root_dir = vim.fn.getcwd()
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

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        local ft = vim.bo.filetype
        -- Only run eslint_d for JS/TS files if ESLint config exists
        if ft == "javascript" or ft == "typescript" or ft == "javascriptreact" or ft == "typescriptreact" or ft == "svelte" then
          if has_eslint_config() then
            lint.try_lint()
          end
        else
          -- For other file types, run normally
          lint.try_lint()
        end
      end,
    })
  end,
}
