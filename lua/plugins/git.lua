return {
	{
		"tpope/vim-fugitive",
		dependencies = {
			"tpope/vim-rhubarb",
		},
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
		config = require("plugins-options.diffview").config,
		cmd = require("plugins-options.diffview").cmd,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		config = require("plugins-options.gitsigns").config,
	},
}
