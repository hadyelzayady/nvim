return {
	{
		"stevearc/oil.nvim",
		cmd = { "Oil" },
		dependencies = { "echasnovski/mini.icons" },
		config = require("plugins-options.oil").config,
	},
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = require("plugins-options.nvim-tree").config,
	},
	{
		"ibhagwan/fzf-lua",
		dependencies = { "echasnovski/mini.icons" },
		event = "VeryLazy",
		config = require("plugins-options.fzf-lua").config,
	},
	{
		"stevearc/quicker.nvim",
		ft = "qf",
		opts = require("plugins-options.quicker").opts,
	},
	{
		"kevinhwang91/nvim-bqf",
		ft = "qf",
		dependencies = {
			{
				"junegunn/fzf",
				build = "./install --bin",
			},
		},
	},
	{
		"folke/flash.nvim",
		keys = require("plugins-options.flash").keys,
		config = require("plugins-options.flash").config,
		vscode = false,
	},
	{
		"echasnovski/mini.bufremove",
		version = false,
		event = "VeryLazy",
		config = require("plugins-options.mini-bufremove").config,
	},
	{
		"otavioschwanck/arrow.nvim",
		dependencies = {
			{ "echasnovski/mini.icons" },
		},
		keys = { ";", "m" },
		opts = {
			show_icons = true,
			leader_key = ";", -- Recommended to be a single key
			buffer_leader_key = "m", -- Per Buffer Mappings
		},
	},
	{
		"chrishrb/gx.nvim",
		keys = { { "gx", "<cmd>Browse<cr>", mode = { "n", "x" } } },
		cmd = { "Browse" },
		init = function()
			vim.g.netrw_nogx = 1
		end,
		dependencies = { "nvim-lua/plenary.nvim" },
		config = require("plugins-options.gx").config,
	},
	{
		"stevearc/aerial.nvim",
		opts = {},
		cmd = { "AerialToggle", "AerialNavToggle" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},
}
