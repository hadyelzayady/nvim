return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		branch = "main",
		config = require("plugins.config.treesitter").config,
		build = ":TSUpdate",
	},
	{
		"liangxianzhe/floating-input.nvim",
		event = "VeryLazy",
	},
	{

		"brenoprata10/nvim-highlight-colors",
		opts = {},
	},
}
