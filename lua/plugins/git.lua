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
	{
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
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
}
