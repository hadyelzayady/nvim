return {
	{
		"emmanueltouzery/agitator.nvim",
		config = require("plugins-options.agitator").config,
		lazy = true,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		config = require("plugins-options.gitsigns").config,
	},
}
