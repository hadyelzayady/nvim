return {
	{
		"sindrets/diffview.nvim",
		config = require("plugins-options.diffview").config,
		cmd = {
			"DiffviewClose",
			"DiffviewFileHistory",
			"DiffviewFocusFiles",
			"DiffviewLog",
			"DiffviewOpen",
			"DiffviewRefresh",
			"DiffviewToggleFiles",
		},
	},
	{
		"tpope/vim-fugitive",
		event = "VeryLazy",
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		config = require("plugins-options.gitsigns").config,
	},
	{
		"TimUntersberger/neogit",
		cmd = "Neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
		},
		config = require("plugins-options.neogit").config,
	},
	{
		"ThePrimeagen/git-worktree.nvim",
		config = require("plugins-options.git-worktree").config,
		event = "VeryLazy",
		dependencies = { "nvim-telescope/telescope.nvim" },
	},
}
