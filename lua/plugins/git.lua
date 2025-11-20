return {
	{
		"tpope/vim-fugitive",
		lazy = false,
		event = "VeryLazy",
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
		"pwntester/octo.nvim",
		cmd = { "Octo" },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"ibhagwan/fzf-lua",
			"nvim-tree/nvim-web-devicons",
		},
		opts = require("plugins.config.octo").opts,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPost", "BufWritePost", "BufNewFile" },
		opts = require("plugins.config.gitsigns").opts,
	},
}
