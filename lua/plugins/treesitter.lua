return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = require("plugins-options.treesitter").config,
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
			"windwp/nvim-ts-autotag",
		},
		{
			"nvim-treesitter/nvim-treesitter-context",
			dependencies = {
				"nvim-treesitter/nvim-treesitter",
			},
			config = require("plugins-options.treesitter-context").config,
		},
	},
}