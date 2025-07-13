return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		config = require("plugins.config.treesitter").config,
		build = ":TSUpdate",
	},
	{
		"catgoose/nvim-colorizer.lua",
		event = "BufReadPre",
		config = require("plugins.config.colorizer").config,
	},
}
