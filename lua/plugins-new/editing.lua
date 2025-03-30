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
	{
		"echasnovski/mini.surround",
		version = false,
		config = require("plugins-options.mini-surround").config,
		keys = { { "s", mode = { "v", "n" } } },
	},
	{
		"mbbill/undotree",
		cmd = "UndotreeToggle",
	},
	{
		"lambdalisue/vim-suda",
		cmd = { "SudoWrite", "SudaRead" },
	},
	{
		"johmsalas/text-case.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", cmd = { "Telescope" } },
		config = require("plugins-options.text-case").config,
		keys = { "ga", { "ga.", "<cmd>TextCaseOpenTelescope<CR>", mode = { "n", "x" }, desc = "Telescope" } },
		cmd = {
			"Subs",
			"TextCaseOpenTelescope",
			"TextCaseOpenTelescopeQuickChange",
			"TextCaseOpenTelescopeLSPChange",
			"TextCaseStartReplacingCommand",
		},
	},
}
