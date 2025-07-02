return {
	{
		"ibhagwan/fzf-lua",
		cmd = "FzfLua",
		config = require("plugins.config.fzf-lua").config,
		dependencies = { "echasnovski/mini.icons" },
	},
	{
		"ms-jpq/chadtree",
		build = "python3 -m chadtree deps",
		branch = "chad",
		lazy = true,
		cmd = { "CHADopen" },
		config = require("plugins.config.chadtree").config,
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
		"stevearc/oil.nvim",
		cmd = { "Oil" },
		dependencies = { "echasnovski/mini.icons" },
		opts = require("plugins.config.oil").opts,
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
		dependencies = {
			{
				"junegunn/fzf",
				build = "./install --bin",
			},
		},
	},
	-- {
	-- 	"folke/flash.nvim",
	-- 	keys = require("plugins-options.flash").keys,
	-- 	config = require("plugins-options.flash").config,
	-- 	vscode = false,
	-- },
}
