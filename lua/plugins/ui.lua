return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = "VeryLazy",
		config = require("plugins-options.treesitter").config,
	},
	{
		"kevinhwang91/nvim-hlslens",
		event = "VeryLazy",
		config = require("plugins-options.hlslens").config,
	},
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
		config = require("plugins-options.dressing").config,
	},
	{

		"echasnovski/mini.indentscope",
		version = false,
		event = "VeryLazy",
		config = require("plugins-options.mini-indentscope").config,
	},
}
