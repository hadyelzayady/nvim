return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		config = require("plugins.config.treesitter").config,
		build = ":TSUpdate",
	},
	{
		"liangxianzhe/floating-input.nvim",
		event = "VeryLazy",
	},
}
