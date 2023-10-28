return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = require("plugins-options.lualine").config,
	},
	{
		"b0o/incline.nvim",
		opts = require("plugins-options.incline").config,
	},
}
