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
	{
		"andymass/vim-matchup",
		init = function()
			-- modify your configuration vars here
			vim.g.matchup_treesitter_stopline = 500

			-- or call the setup function provided as a helper. It defines the
			-- configuration vars for you
			require("match-up").setup({
				treesitter = {
					stopline = 500,
				},
			})
		end,
		-- or use the `opts` mechanism built into `lazy.nvim`. It calls
		-- `require('match-up').setup` under the hood
		---@type matchup.Config
		opts = {
			treesitter = {
				stopline = 500,
			},
		},
	},
}
