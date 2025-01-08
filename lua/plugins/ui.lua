return {
	{
		"ficcdaf/ashen.nvim",
		lazy = false,
		priority = 1000,
		-- configuration is optional!
		opts = {
			-- your settings here
		},
		enabled = false,
		config = function()
			require("ashen").setup({
				-- your settings here
			})
			vim.cmd("colorscheme ashen")
			-- You may call the load function as well
			require("ashen").load()
		end
	},
	{
		'comfysage/evergarden',
		priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
		opts = {
			transparent_background = false,
			variant = 'medium', -- 'hard'|'medium'|'soft'
			overrides = {
				DiffText = {
					bg = "#000000"
				}

			}, -- add custom overrides
		},
		lazy = false,
		config = function(_, opts)
			require 'evergarden'.setup(opts)
			vim.cmd("colorscheme evergarden")
		end
	},
	{
		"echasnovski/mini.indentscope",
		version = false,
		event = "VeryLazy",
		config = require("plugins-options.mini-indentscope").config,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = "VeryLazy",
		config = require("plugins-options.treesitter").config,
	},
	{
		"stevearc/dressing.nvim",
		config = require("plugins-options.dressing").config,
		event = "VeryLazy",
	},
	-- {
	-- 	"MeanderingProgrammer/render-markdown.nvim",
	-- 	dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" },
	-- 	opts = {},
	-- },
}
