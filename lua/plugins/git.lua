return {
	{
		"tpope/vim-fugitive",
		-- cmd = {
		-- 	"Git",
		-- 	"Gstatus",
		-- 	"Gblame",
		-- 	"Gdiffsplit",
		-- 	"Gvdiffsplit",
		-- 	"Gbrowse",
		-- 	"Gread",
		-- 	"Gwrite",
		-- 	"GDelete",
		-- 	"GMove",
		-- 	"GRename",
		-- },
	},
	{
		"emmanueltouzery/agitator.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
		lazy = true,
	},
	{
		"sindrets/diffview.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = require("plugins.config.diffview").opts,
		cmd = require("plugins.config.diffview").cmd,
	},
	{
		"pwntester/octo.nvim",
		cmd = { "Octo" },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"ibhagwan/fzf-lua",
			"nvim-tree/nvim-web-devicons",
		},
		opts = require("plugins.config.octo").opts,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPost", "BufWritePost", "BufNewFile" },
		opts = require("plugins.config.gitsigns").opts,
	},
	{
		"esmuellert/vscode-diff.nvim",
		enabled = false,
		dependencies = { "MunifTanjim/nui.nvim" },
	},
	{
		"otavioschwanck/github-pr-reviewer.nvim",
		opts = {
			-- options here
		},
		keys = {
			{ "<leader>P", "<cmd>PRReviewMenu<cr>", desc = "PR Review Menu" },
			{ "<leader>P", ":<C-u>'<,'>PRSuggestChange<CR>", desc = "Suggest change", mode = "v" },
		},
	},
	{
		"Juksuu/worktrees.nvim",
		opts = {},
	},
	{
		"NeogitOrg/neogit",
		cmd = "Neogit",
		opts = require("plugins.config.neogit").opts,
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration
			"ibhagwan/fzf-lua", -- optional
		},
	},
}
