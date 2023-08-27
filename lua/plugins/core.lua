return {
	{
		"max397574/better-escape.nvim",
		opts = require("plugins-options.better-escape"),
	},
	{
		"mbbill/undotree",
		cmd = { "UndotreeFocus", "UndotreeHide", "UndotreeShow", "UndotreeToggle" },
		config = function()
			vim.cmd("source ~/.config/nvim/vimscript/undotree.vim")
		end,
	},
	{
		"gbprod/stay-in-place.nvim",
		opts = {
			set_keymaps = true,
			preserve_visual_selection = true,
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = "BufReadPost",
		opts = require("plugins-options.treesitter"),
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	{
		"olimorris/persisted.nvim",
		config = require("plugins-options.persisted").config,
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
	},
}
