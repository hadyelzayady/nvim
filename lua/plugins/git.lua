return {
	{
		"tpope/vim-fugitive",
		lazy = false,
	},
	{
		"emmanueltouzery/agitator.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
		lazy = true,
	},
	{
		"sindrets/diffview.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = require("plugins.config.diffview").opts,
		cmd = require("plugins.config.diffview").cmd,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
	},
}
