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
}
