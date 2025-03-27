return {
	{
		"max397574/better-escape.nvim",
		config = require("plugins-options.better-escape").config,
		event = "InsertEnter",
	},
	{
		"echasnovski/mini.pairs",
		event = "InsertEnter",
		version = false,
		config = require("plugins-options.mini-pairs").config,
	},
	{
		"echasnovski/mini.splitjoin",
		version = false,
		keys = { "gs", "gS", "gJ" },
		config = require("plugins-options.mini-splitjoin").config,
	},
}
