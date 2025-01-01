return {
	{
		"b0o/schemastore.nvim",
	},
	{
		"williamboman/mason.nvim",
		event = "VeryLazy",
		config = true,
	},
	{
		"neovim/nvim-lspconfig",
		config = require("plugins-options.lsp.lspconfig").config,
	},
}
