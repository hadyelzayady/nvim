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
	-- Install without configuration
	{
		"projekt0n/github-nvim-theme",
		enabled = false,
	},
	{
		"miikanissi/modus-themes.nvim",
		priority = 1000,
		enabled = false,
	},
	{
		"briones-gabriel/darcula-solid.nvim",
		dependencies = "rktjmp/lush.nvim",
		enabled = false,
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
			vim.cmd("hi DiffAdd guibg=#1f572c")
			vim.cmd("hi DiffChange guibg=#13401f")
			vim.cmd("hi DiffText guibg=#1f7d2c")
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
		event = "VeryLazy",
		config = require("plugins-options.dressing").config,
	},
	{
		"uga-rosa/ccc.nvim",
		config = require("plugins-options.ccc").config,
		cmd = { "CccConvert", "CccPick", "CccHighlighterToggle" },
	},
	{
		"kevinhwang91/nvim-hlslens",
		event = "VeryLazy",
		config = require("plugins-options.hlslens").config,
	},
	{
		"3rd/image.nvim",
		enabled = false,
		config = require("plugins-options.image").config,
	},
	{

		"echasnovski/mini.indentscope",
		version = false,
		event = "VeryLazy",
		config = require("plugins-options.mini-indentscope").config,
	},
	{
		"lukas-reineke/headlines.nvim",
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = true, -- or `opts = {}`
	},
	{
		"kevinhwang91/nvim-ufo",
		dependencies = {
			"kevinhwang91/promise-async",
			{
				"luukvbaal/statuscol.nvim",
				config = function()
					local builtin = require("statuscol.builtin")
					require("statuscol").setup({
						foldfunc = "builtin",
						relculright = true,
						segments = {
							{ text = { " ", builtin.foldfunc }, click = "v:lua.ScFa" },
							{ text = { "%s" }, click = "v:lua.ScSa" },
							{ text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
						},
					})
				end,
			},
		},
		event = "VeryLazy",
		config = require("plugins-options.nvim-ufo").config,
	},
}
