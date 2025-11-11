return {
	{
		"ibhagwan/fzf-lua",
		cmd = "FzfLua",
		---@diagnostic disable-next-line: different-requires
		config = require("plugins.config.fzf-lua").config,
		dependencies = { "echasnovski/mini.icons" },
	},
	{
		"A7Lavinraj/fyler.nvim",
		dependencies = { "nvim-mini/mini.icons" },
		enabled = false,
		branch = "main",
		opts = {},
	},
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = require("plugins.config.nvimtree").config,
	},
	{

		"chrishrb/gx.nvim",
		keys = { { "gx", "<cmd>Browse<cr>", mode = { "n", "x" } } },
		dependencies = { "nvim-lua/plenary.nvim" }, -- Required for Neovim < 0.10.0
		cmd = { "Browse" },
		submodules = false,
		opts = require("plugins.config.gx").opts,
	},
	{
		"echasnovski/mini.bufremove",
		version = false,
		event = "VeryLazy",
		config = true,
	},
	{
		"stevearc/aerial.nvim",
		opts = require("plugins.config.aerial").opts,
		cmd = { "AerialToggle", "AerialNavToggle" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		"stevearc/quicker.nvim",
		ft = "qf",
		config = true,
	},
	{
		"kevinhwang91/nvim-bqf",
		ft = "qf",
		opts = require("plugins.config.bqf").opts,
		dependencies = {
			{
				"junegunn/fzf",
				build = "./install --bin",
			},
		},
	},
	{
		"s1n7ax/nvim-window-picker",
		name = "window-picker",
		event = "VeryLazy",
		version = "2.*",
		config = function()
			require("window-picker").setup({
				hint = "floating-big-letter",
			})
		end,
	},
}
