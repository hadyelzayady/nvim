return {
	{
		"folke/which-key.nvim",
		opts = require("plugins.config.whichkey").opts,
		event = "VeryLazy",
		cond = function()
			return vim.o.columns > 80 -- skip for small windows
		end,
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
