return {
	{
		"max397574/better-escape.nvim",
		opts = require("plugins.config.better-escape").opts,
		event = "InsertEnter",
	},
	{
		"echasnovski/mini.pairs",
		event = "InsertEnter",
		version = false,
		config = require("plugins.config.mini-pairs").config,
	},
	{
		"echasnovski/mini.splitjoin",
		version = false,
		keys = { "gs", "gS", "gJ" },
		opts = require("plugins.config.mini-splitjoin").opts,
	},
	{
		"echasnovski/mini.surround",
		version = false,
		opts = require("plugins.config.mini-surround").opts,
		keys = { { "s", mode = { "v", "n" } } },
	},
	{
		"echasnovski/mini.ai",
		version = false,
		event = "VeryLazy",
		dependencies = {
			{
				"nvim-treesitter/nvim-treesitter-textobjects",
				init = function()
					-- no need to load the plugin, since we only need its queries
					require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
				end,
			},
		},
		opts = require("plugins.config.mini-ai").opts,
	},
	{
		"MagicDuck/grug-far.nvim",
		opts = require("plugins.config.grug-far").opts,
		cmd = { "GrugFar", "GrugFarWithin" },
	},
	{
		"windwp/nvim-ts-autotag",
		config = require("plugins.config.autotag").config,
	},
}
