return {
	"mason-org/mason-lspconfig.nvim",
	dependencies = {
		"mason-org/mason.nvim",
		"neovim/nvim-lspconfig",
	},
	opts = {
		ensure_installed = {
			"bashls",
			"cssls",
			"docker_compose_language_service",
			"dockerls",
			"eslint",
			"emmet_ls",
			"html",
			"lua_ls",
			"marksman",
			"prismals",
			"pyright",
			"rust_analyzer",
			"solidity_ls_nomicfoundation",
			"tailwindcss",
			"vtsls",
		},
		automatic_enable = {
			exclude = {},
		},
	},
}
