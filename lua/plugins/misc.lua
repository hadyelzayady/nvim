return {
	{
		"chrisgrieser/nvim-early-retirement",
		config = require("plugins-options.nvim-early-retirement").config,
		event = "VeryLazy",
	},
	{
		"echasnovski/mini.bufremove",
		version = false,
		config = require("plugins-options.mini-bufremove").config,
	},
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = require("plugins-options.toggleterm").config,
	},
}
