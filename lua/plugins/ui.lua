return {

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = require("plugins-options.treesitter").config,
	},
	{
		"echasnovski/mini.indentscope",
		version = false,
		event = "VeryLazy",
		config = require("plugins-options.mini-indentscope").config,
	},
	{
		"kevinhwang91/nvim-hlslens",
		event = "VeryLazy",
		config = require("plugins-options.hlslens").config,
	},
	{
		"dhruvasagar/vim-zoom",
	},
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
		config = require("plugins-options.dressing").config,
	},
}
