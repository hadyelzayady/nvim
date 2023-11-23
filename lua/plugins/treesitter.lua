return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = require("plugins-options.treesitter").config,
		dependencies = {
			"windwp/nvim-ts-autotag",
		},
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		config = require("plugins-options.treesitter-context").config,
	},
}
