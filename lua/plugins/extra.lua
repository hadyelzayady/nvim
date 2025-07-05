return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = require("plugins.config.whichkey").opts,
	},
	{
		"folke/snacks.nvim",
		lazy = false,
		priority = 1000,
		opts = require("plugins.config.snacks").opts,
	},
	{
		"chrisgrieser/nvim-chainsaw",
		keys = { "<space>," },
		opts = {}, -- required even if left empty
	},
}
