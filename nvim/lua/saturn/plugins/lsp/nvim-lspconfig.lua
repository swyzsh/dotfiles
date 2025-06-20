return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
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
