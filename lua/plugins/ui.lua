return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			require("tokyonight").setup()
			vim.cmd([[colorscheme tokyonight-night]])
			vim.cmd("hi DiffAdd guifg=#26ac3c guibg=#303030 gui=reverse cterm=reverse")
			vim.cmd("hi DiffChange guifg=#2b97b4 guibg=#303030 gui=reverse cterm=reverse")
			vim.cmd("hi DiffDelete guifg=#c94300 guibg=#303030 gui=reverse cterm=reverse")
			vim.cmd("hi DiffText guifg=#e99200 guibg=#303030 gui=reverse cterm=reverse")
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		enabled = false,
		config = require("plugins-options.catppuccin").config,
		priority = 1000,
	},
	{
		"echasnovski/mini.cursorword",
		version = false,
		config = require("plugins-options.mini-cursorword").config,
	},
	{

		"echasnovski/mini.indentscope",
		version = false,
		config = require("plugins-options.mini-indentscope").config,
	},
	{
		"stevearc/dressing.nvim",
		config = require("plugins-options.dressing").config,
	},
	{
		"dhruvasagar/vim-zoom",
	},
	{
		"uga-rosa/ccc.nvim",
		config = require("plugins-options.ccc").config,
	},
}
