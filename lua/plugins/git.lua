return {
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		enabled = false,
		config = require("plugins-options.gitsigns").config,
	},
	{
		"echasnovski/mini.nvim",
		version = false,
	},
	{
		"sindrets/diffview.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = require("plugins-options.diffview").config,
		cmd = require("plugins-options.diffview").cmd,
	},
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration
			"ibhagwan/fzf-lua", -- optional
		},
		config = require("plugins-options.neogit").config,
		cmd = { "Neogit" },
	},
	{
		"emmanueltouzery/agitator.nvim",
		lazy = true,
	},
}
