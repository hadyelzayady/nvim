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
		enabled = true,
		opts = require("plugins.config.autosession").opts,
	},
	{
		"vuki656/package-info.nvim",
		dependencies = "MunifTanjim/nui.nvim",
		opts = require("plugins.config.package-info").opts,
		lazy = true,
	},
	{
		"brianhuster/live-preview.nvim",
		dependencies = {
			"ibhagwan/fzf-lua",
		},
		cmd = { "LivePreview" },
	},
}
