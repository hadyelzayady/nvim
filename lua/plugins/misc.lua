return {
	{
		"echasnovski/mini.misc",
		version = false,
		config = require("plugins-options.mini-misc").config,
	},
	{
		"folke/neodev.nvim",
		opts = {},
	},
	{
		"lambdalisue/suda.vim",
		cmd = { "SudaRead", "SudaWrite" },
	},
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = require("plugins-options.toggleterm").config,
	},
	{
		"echasnovski/mini.bufremove",
		version = false,
		config = require("plugins-options.mini-bufremove").config,
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	{
		"altermo/nxwm",
	},
	{
		"chrisgrieser/nvim-scissors",
		enabled = false,
		-- dependencies = "nvim-telescope/telescope.nvim",
		opts = {
			snippetDir = vim.fn.stdpath("config") .. "/lua/plugins-options/completion/snippets",
		},
	},
	-- {
	-- 	"olimorris/persisted.nvim",
	-- 	config = require("plugins-options.persisted").config,
	-- 	dependencies = {
	-- 		{
	-- 			"nvim-telescope/telescope.nvim",
	-- 			tag = "0.1.5",
	-- 			-- or                              , branch = '0.1.x',
	-- 			dependencies = { "nvim-lua/plenary.nvim" },
	-- 		},
	-- 	},
	-- },
	{
		"jedrzejboczar/possession.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			dependencies = {
				{
					"nvim-telescope/telescope.nvim",
					tag = "0.1.5",
					-- or                              , branch = '0.1.x',
					dependencies = { "nvim-lua/plenary.nvim" },
				},
			},
		},
		config = require("plugins-options.possession").config,
	},
}
