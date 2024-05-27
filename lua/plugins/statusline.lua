return {
	{
		"nvim-lualine/lualine.nvim",
		priority = 1000,
		-- event = "VeryLazy",
		config = require("plugins-options.lualine").config,
	},
}
