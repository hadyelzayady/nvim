return {
	{
		"folke/ts-comments.nvim",
		enabled = vim.fn.has("nvim-0.10.0") == 1,
		opts = {},
		event = "VeryLazy",
	},

	{
		"max397574/better-escape.nvim",
		config = require("plugins-options.better-escape").config,
		event = "InsertEnter",
	},

	{
		"echasnovski/mini.surround",
		version = false,
		config = require("plugins-options.mini-surround").config,
		keys = { "s" },
	},
	{
		"johmsalas/text-case.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
		config = require("plugins-options.text-case").config,
		keys = { "ga", },
		cmd = { "Subs", "TextCaseOpenTelescope", "TextCaseOpenTelescopeQuickChange", "TextCaseOpenTelescopeLSPChange", "TextCaseStartReplacingCommand", },
	},

	{
		"echasnovski/mini.splitjoin",
		version = false,
		keys = { "gs","gS","gJ" },
		config = require("plugins-options.mini-splitjoin").config,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = require("plugins-options.nvim-autopairs").config,
	},
	{
		"mg979/vim-visual-multi",
		branch = "master",
		keys = { "<C-n>" },
		--[[
        press n/N to get next/previous occurrence
        press [/] to select next/previous cursor
        press q to skip current and get next occurrence
        press Q to remove current cursor/selection
        start insert mode with i,a,I,A
        Two main modes:

        in cursor mode commands work as they would in normal mode
        in extend mode commands work as they would in visual mode
        press Tab to switch between «cursor» and «extend» mode
    --]]
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
		config = require("plugins-options.mini-ai").config,
	},
}
