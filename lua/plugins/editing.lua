return {
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
	{
		"echasnovski/mini.align",
		version = false,
		config = require("plugins-options.mini-align").config,
	},
	{
		"echasnovski/mini.pairs",
		version = false,
		config = require("plugins-options.mini-pairs").config,
	},
	{
		"echasnovski/mini.splitjoin",
		version = false,
		config = require("plugins-options.mini-splitjoin").config,
	},
	{
		"echasnovski/mini.surround",
		version = false,
		config = require("plugins-options.mini-surround").config,
	},
	{
		"echasnovski/mini.comment",
		version = false,
		config = require("plugins-options.mini-comment").config,
	},
	{
		"max397574/better-escape.nvim",
		config = require("plugins-options.better-escape").config,
	},
	{
		"mbbill/undotree",
		cmd = { "UndotreeFocus", "UndotreeHide", "UndotreeShow", "UndotreeToggle" },
		config = function()
			vim.cmd("source ~/.config/nvim/vimscript/undotree.vim")
		end,
	},
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = require("plugins-options.refactoring").config,
	},
	{
		"smjonas/live-command.nvim",
		-- live-command supports semantic versioning via tags
		-- tag = "1.*",
		config = function()
			require("live-command").setup({
				commands = {
					Norm = { cmd = "norm" },
				},
			})
		end,
	},
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	{
		"mg979/vim-visual-multi",
		branch = "master",
	},
}
