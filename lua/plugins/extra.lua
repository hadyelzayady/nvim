return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = require("plugins.config.whichkey").opts,
	},
	{
		"folke/snacks.nvim",
		lazy = false,
		priority = 1000,
		opts = require("plugins.config.snacks").opts,
	},
	{
		"chrisgrieser/nvim-chainsaw",
		keys = { "<space>," },
		opts = {}, -- required even if left empty
	},
	{
		"allaman/emoji.nvim",
		cmd = "Emoji", -- adjust to your needs
		dependencies = {
			"nvim-lua/plenary.nvim",
			"saghen/blink.cmp",
			"ibhagwan/fzf-lua",
		},
		opts = {},
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" }, -- if you use standalone mini plugins
		opts = {
			latex = { enabled = false },
		},
	},
	{
		"mbbill/undotree",
	},
}
