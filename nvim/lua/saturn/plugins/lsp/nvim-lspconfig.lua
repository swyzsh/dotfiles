return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"saghen/blink.cmp",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- vim.api.nvim_create_autocmd("LspAttach", {
		-- 	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
		-- 	callback = function(event)
		-- 		local remap = require("saturn.remap")
		-- 		remap.lsp_keymaps(event.buf)
		-- 	end,
		-- })

		lspconfig.cssls.setup({
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
			"docker_compose_language_service",
			"dockerls",
			"emmet_ls",
			"eslint",
			"html",
			"marksman",
			"prismals",
			"pyright",
			"solidity_ls_nomicfoundation",
			"tailwindcss",
			"vtsls",
		}

		for _, server in ipairs(servers) do
			lspconfig[server].setup({
				capabilities = capabilities,
			})
		end
	end,
}
