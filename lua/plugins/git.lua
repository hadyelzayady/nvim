return {
	{
		"sindrets/diffview.nvim",
		config = require("plugins-options.diffview").config,
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
		"sindrets/diffview.nvim",
		config = require("plugins-options.diffview").config,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = require("plugins-options.gitsigns").config,
	},
}
