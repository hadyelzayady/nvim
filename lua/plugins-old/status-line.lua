return {
	{
		"nvim-lualine/lualine.nvim",
		priority = 1000,
    event="VeryLazy",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			-- "mikesmithgh/git-prompt-string-lualine.nvim",
		},
		config = require("plugins-options.lualine").config,
	},
	{
		"b0o/incline.nvim",
		opts = require("plugins-options.incline").config,
	},
	{
		"mikesmithgh/git-prompt-string-lualine.nvim",
		enabled = false,
		lazy = true,
	},
}
