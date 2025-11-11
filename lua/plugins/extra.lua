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
}
