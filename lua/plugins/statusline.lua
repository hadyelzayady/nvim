return {
	{
		"nvim-lualine/lualine.nvim",
		priority = 1000,
		-- event = "VeryLazy",
		config = require("plugins-options.lualine").config,
	},
	{
		"b0o/incline.nvim",
		config = require("plugins-options.incline").config,
	},
}
