return {
	{
		"emmanueltouzery/agitator.nvim",
		config = require("plugins-options.agitator").config,
	},
	{
		"echasnovski/mini.diff",
		config = require("plugins-options.mini-diff").config,
		enabled = false,
		version = false,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		config = require("plugins-options.gitsigns").config,
	},
}
