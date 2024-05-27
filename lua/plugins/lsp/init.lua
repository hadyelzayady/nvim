return {
	{
		"neovim/nvim-lspconfig",
		config = require("plugins-options.lsp.lspconfig").config,
	},
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		ft = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
		config = require("plugins-options.lsp.plugins.typescript-tools").config,
	},
	{
		"antosha417/nvim-lsp-file-operations",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("lsp-file-operations").setup()
		end,
	},
	{
		"williamboman/mason.nvim",
		config = true,
		event = "VeryLazy",
	},
	{
		"b0o/schemastore.nvim",
	},
}
