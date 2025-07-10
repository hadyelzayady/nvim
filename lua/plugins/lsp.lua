return {
	{
		"neovim/nvim-lspconfig",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
	},
	{
		"stevearc/conform.nvim",
		lazy = true,
		opts = require("plugins.config.conform").opts,
	},
	{
		"nvim-java/nvim-java",
		dependencies = { "neovim/nvim-lspconfig" },
		opts = {},
	},
}
