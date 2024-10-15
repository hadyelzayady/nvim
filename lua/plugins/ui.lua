return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = "VeryLazy",
		config = require("plugins-options.treesitter").config,
	},
	{
		"kevinhwang91/nvim-hlslens",
		event = "VeryLazy",
		config = require("plugins-options.hlslens").config,
	},
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
		config = require("plugins-options.dressing").config,
	},
	{

		"echasnovski/mini.indentscope",
		version = false,
		event = "VeryLazy",
		config = require("plugins-options.mini-indentscope").config,
	},
	{
		"norcalli/nvim-colorizer.lua",
		event = "VeryLazy",
		config = true,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		cmd = { "TSContextEnable", "TSContextDisable", "TSContextToggle" },
		config = require("plugins-options.treesitter-context").config,
	},
	{
		"dhruvasagar/vim-zoom",
	},
	{
		"MeanderingProgrammer/markdown.nvim",
		main = "render-markdown",
		opts = {},
		name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
		ft = { "markdown" },
		cmd = { "RenderMarkdown" },
		dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" }, -- if you use standalone mini plugins
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
	},
	{
		"bullets-vim/bullets.vim",
		ft = { "markdown" },
		event = "VeryLazy",
	},
	{
		"HiPhish/rainbow-delimiters.nvim",
		config = require("plugins-options.rainbow-delimiters").config,
		event = "VeryLazy",
	},
}
