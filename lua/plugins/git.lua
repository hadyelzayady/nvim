return {
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		config = require("plugins-options.gitsigns").config,
	},
	{
		"sindrets/diffview.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = require("plugins-options.diffview").config,
		cmd = require("plugins-options.diffview").cmd,
	},
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration
			"ibhagwan/fzf-lua", -- optional
		},
		config = require("plugins-options.neogit").config,
		cmd = { "Neogit" },
	},
	{
		"emmanueltouzery/agitator.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
		lazy = true,
	},
	{
		"tpope/vim-fugitive",
		lazy = false,
	},
	{
		"aaronhallaert/advanced-git-search.nvim",
		cmd = { "AdvancedGitSearch" },
		config = function()
			require("advanced_git_search.fzf").setup({
				-- fugitive or diffview
				diff_plugin = "diffview",
				-- Insert Config here
			})
		end,
		dependencies = {
			"ibhagwan/fzf-lua",
			"tpope/vim-fugitive",
			"tpope/vim-rhubarb",
			"sindrets/diffview.nvim",
		},
	},
	{
		"pwntester/octo.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"ibhagwan/fzf-lua",
			"nvim-tree/nvim-web-devicons",
		},
		cmd = { "Octo" },
		config = function()
			require("octo").setup({
				picker = "fzf-lua", -- or "telescope"
			})
		end,
	},
	{
		"dlvhdr/gh-addressed.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"folke/trouble.nvim",
		},
		cmd = "GhReviewComments",
	},
}
