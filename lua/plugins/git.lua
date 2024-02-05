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
	},
	{
		"lambdalisue/gin.vim",
		cmd = { "Gin" },
		dependencies = {
			"vim-denops/denops.vim",
		},
	},
	{
		"lewis6991/gitsigns.nvim",
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
		"chrisgrieser/nvim-tinygit",
		ft = { "gitrebase", "gitcommit" }, -- so ftplugins are loaded
		dependencies = {
			"stevearc/dressing.nvim",
			"rcarriga/nvim-notify", -- optional, but recommended
		},
	},
	{
		"ThePrimeagen/git-worktree.nvim",
		config = require("plugins-options.git-worktree").config,
	},
	{
		"akinsho/git-conflict.nvim",
		version = "*",
		enabled = false,
		config = require("plugins-options.git-conflict").config,
	},
}
