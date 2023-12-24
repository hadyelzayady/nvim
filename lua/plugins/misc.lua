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
}
