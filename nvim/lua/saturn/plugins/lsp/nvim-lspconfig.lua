return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"mason-org/mason.nvim",
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		local lspconfig = require("lspconfig")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		local function setup_if_installed(mason_name, lsp_name, config)
			local mason_registry = require("mason-registry")
			if mason_registry.is_installed(mason_name) then
				local server_config = vim.tbl_deep_extend("force", { capabilities = capabilities }, config or {})
				lspconfig[lsp_name].setup(server_config)
			end
		end

		setup_if_installed("css-lsp", "cssls", {
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

		setup_if_installed("lua-language-server", "lua_ls", {
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
		local server_map = {
			["bash-language-server"] = "bashls",
			["docker-compose-language-service"] = "docker_compose_language_service",
			["dockerfile-language-server"] = "dockerls",
			["emmet-ls"] = "emmet_ls",
			["eslint-lsp"] = "eslint",
			["html-lsp"] = "html",
			["julia-lsp"] = "julials",
			["marksman"] = "marksman",
			["prisma-language-server"] = "prismals",
			["pyright"] = "pyright",
			["nomicfoundation-solidity-language-server"] = "solidity_ls_nomicfoundation",
			["rust-analyzer"] = "rust_analyzer",
			["tailwindcss-language-server"] = "tailwindcss",
			["vtsls"] = "vtsls",
		}

		for mason_name, lsp_name in pairs(server_map) do
			setup_if_installed(mason_name, lsp_name)
		end
	end,
}
