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
		end,
	},
	{
		"zenbones-theme/zenbones.nvim",
		-- Optionally install Lush. Allows for more configuration or extending the colorscheme
		-- If you don't want to install lush, make sure to set g:zenbones_compat = 1
		-- In Vim, compat mode is turned on as Lush only works in Neovim.
		dependencies = "rktjmp/lush.nvim",
		lazy = false,
		priority = 1000,
		-- you can set set configuration options here
		config = function()
			vim.g.duckbones_darken_comments = 100
			vim.g.duckbones_lighten_cursor_line = 15
			vim.cmd.colorscheme("duckbones")
		end,
	},
	{
		"comfysage/evergarden",
		priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
		lazy = false,
		config = require("plugins-options.evergarden").config,
	},
	{
		"p00f/alabaster.nvim",
		lazy = true,
	},
	{
		"kvrohit/rasmus.nvim",
		priority = 1000,
		lazy = false,
		-- config = function()
		-- 	vim.cmd([[colorscheme rasmus]])
		-- end,
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
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" },
		lazy = false,
		opts = {
			file_types = { "markdown", "mdx" },
		},
	},
	{
		"davidmh/mdx.nvim",
		lazy = false,
		config = true,
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},
}
