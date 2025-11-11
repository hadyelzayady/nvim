return {
	{
		"tpope/vim-fugitive",
		lazy = false,
	},
	{
		"pwntester/octo.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"ibhagwan/fzf-lua",
			"nvim-tree/nvim-web-devicons",
		},
		opts = require("plugins.config.octo").opts,
	},
}
