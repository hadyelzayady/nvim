return {
	{
		"neovim/nvim-lspconfig",
		lazy = true,
	},
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		ft = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
		config = require("plugins-options.lsp.plugins.typescript-tools").config,
	},
}
