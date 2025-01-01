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
	{
		"antosha417/nvim-lsp-file-operations",
		event = "VeryLazy",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-tree.lua",
		},
		config = function()
			require("lsp-file-operations").setup()
		end,
	},
	{
		"yioneko/nvim-vtsls",
		event = "VeryLazy",
	},
}
