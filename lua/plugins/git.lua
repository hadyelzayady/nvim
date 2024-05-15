return {
	{
		"sindrets/diffview.nvim",
		config = require("plugins-options.diffview").config,
		cmd = {
			"DiffviewClose",
			"DiffviewFileHistory",
			"DiffviewFocusFiles",
			"DiffviewLog",
			"DiffviewOpen",
			"DiffviewRefresh",
			"DiffviewToggleFiles",
		},
	},
	{
		"tpope/vim-fugitive",
		event = "VeryLazy",
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		config = require("plugins-options.gitsigns").config,
	},
	{
		"TimUntersberger/neogit",
		cmd = "Neogit",
		branch = "nightly",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
		},
		config = require("plugins-options.neogit").config,
	},
	{
		"ThePrimeagen/git-worktree.nvim",
		config = require("plugins-options.git-worktree").config,
		event = "VeryLazy",
		dependencies = { "nvim-telescope/telescope.nvim" },
	},
	{
		"pwntester/octo.nvim",
		event = "VeryLazy",
		enabled = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"ibhagwan/fzf-lua",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("octo").setup()
		end,
	},
	{
		"FabijanZulj/blame.nvim",
		cmd = { "BlameToggle" },
		config = function()
			require("blame").setup()
		end,
	},
  {
    "whiteinge/diffconflicts"
  },
	{
		"SuperBo/fugit2.nvim",
		opts = {
			width = 70,
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
			"nvim-lua/plenary.nvim",
			{
				"chrisgrieser/nvim-tinygit", -- optional: for Github PR view
				dependencies = { "stevearc/dressing.nvim" },
			},
		},
		cmd = { "Fugit2", "Fugit2Diff", "Fugit2Graph" },
		keys = {
			{ "<leader>F", mode = "n", "<cmd>Fugit2<cr>" },
		},
	},
}
