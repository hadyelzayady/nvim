return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = require("plugins.config.whichkey").opts,
	},
	{
		"chrisgrieser/nvim-chainsaw",
		keys = { "<space>," },
		opts = {},
	},
	{
		"rmagatti/auto-session",
		lazy = false,
		opts = require("plugins.config.autosession").opts,
	},
}
