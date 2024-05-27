return {
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons", },
		config = require("plugins-options.nvim-tree").config,
	},
	{
		"ibhagwan/fzf-lua",
		cmd = { "FzfLua" },
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = require("plugins-options.fzf-lua").config,
	},
	{
		"stevearc/oil.nvim",
		cmd = { "Oil" },
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = require("plugins-options.oil").config,
	},
	{
		"kevinhwang91/nvim-bqf",
		ft = "qf",
		dependencies = { {
			"junegunn/fzf",
			build = function()
				vim.fn["fzf#install"]()
			end,
		} },
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
		"folke/trouble.nvim",
		cmd = { "Trouble", "TroubleToggle", "TroubleClose" },
	},
	{
		"folke/flash.nvim",
		keys = require("plugins-options.flash").keys,
		config = require("plugins-options.flash").config,
	},

	{
		"echasnovski/mini.bufremove",
		version = false,
		keys = { { "<space>d", desc = "Delete Buffer" }, { "<space>D", desc = "Force Delete Buffer" } },
		config = require("plugins-options.mini-bufremove").config,
	},
	{
		"dnlhc/glance.nvim",
		cmd = { "Glance" },
	},
	{
		"stevearc/aerial.nvim",
		config = require("plugins-options.aerial").config,
		cmd = { "AerialToggle", "AerialNavToggle" },
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
	},
}
