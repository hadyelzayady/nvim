return {
	{
		"dhruvasagar/vim-zoom",
	},
	{
		"xiantang/darcula-dark.nvim",
		priority = 1000,
		enabled = false,
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			vim.cmd([[colorscheme darcula-dark]])
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			require("tokyonight").setup({

				dim_inactive = true, -- dims inactive windows
				on_colors = function(colors)
					colors.border = "#565f89"
					colors.bg_visual = "#53003c"
				end,
			})
			vim.cmd([[colorscheme tokyonight-night]])
			-- vim.cmd("hi DiffAdd guifg=#26ac3c guibg=#303030 gui=reverse cterm=reverse")
			-- vim.cmd("hi DiffChange guifg=#2b97b4 guibg=#303030 gui=reverse cterm=reverse")
			-- vim.cmd("hi DiffDelete guifg=#c94300 guibg=#303030 gui=reverse cterm=reverse")
			-- vim.cmd("hi DiffText guifg=#e99200 guibg=#303030 gui=reverse cterm=reverse")
		end,
	},

	{
		"catppuccin/nvim",
		enabled = false,
		name = "catppuccin",
		config = require("plugins-options.catppuccin").config,
		priority = 1000,
	},
	{
		"rebelot/kanagawa.nvim",
		enabled = false,
		config = require("plugins-options.kanagawa").config,
		priority = 1000,
	},
	{
		"stevearc/dressing.nvim",
		config = require("plugins-options.dressing").config,
	},
	{
		"uga-rosa/ccc.nvim",
		config = require("plugins-options.ccc").config,
		cmd = { "CccConvert", "CccPick", "CccHighlighterToggle" },
	},
	{
		"kevinhwang91/nvim-hlslens",
		config = require("plugins-options.hlslens").config,
	},
	{
		"3rd/image.nvim",
		config = require("plugins-options.image").config,
	},
	{

		"echasnovski/mini.indentscope",
		version = false,
		config = require("plugins-options.mini-indentscope").config,
	},
}
