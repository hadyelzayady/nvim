return {
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		config = require("plugins-options.gitsigns").config,
	},

	{
		"sindrets/diffview.nvim",
		config = require("plugins-options.diffview").config,
		cmd = require("plugins-options.diffview").cmd,
	},
	{
		"tpope/vim-fugitive",
		event = "VeryLazy",
	},
	{
		"TimUntersberger/neogit",
		cmd = "Neogit",
		dependencies = { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim", },
		config = require("plugins-options.neogit").config,
	},
	{
		"whiteinge/diffconflicts",
		cmd = { "DiffConflicts", "DiffConflictsShowHistory", "DiffConflictsWithHistory" },
	},
}
