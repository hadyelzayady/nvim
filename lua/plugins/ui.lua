return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		config = require("plugins.config.treesitter").config,
		build = ":TSUpdate",
	},
	{
		"liangxianzhe/floating-input.nvim",
	},
}
