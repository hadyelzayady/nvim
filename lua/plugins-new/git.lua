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
	{
		"sindrets/diffview.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = require("plugins-options.diffview").config,
		cmd = require("plugins-options.diffview").cmd,
	},
}
