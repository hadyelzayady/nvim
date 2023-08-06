return {
	{
		"shellRaining/hlchunk.nvim",
		event = { "UIEnter" },
		opts = require("plugins-options.hlchunk"),
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
	},
	{
		"stevearc/dressing.nvim",
		opts = require("plugins-options.dressing"),
	},
	{
		-- TODO: To be removed after shellRaining/hlchunk hlchunk is fixed
		"yaocccc/nvim-hlchunk",
    enabled=false,
		config = function()
			vim.cmd("source ~/.config/nvim/vimscript/hlchunk.vim")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		opts = require("plugins-options.lualine"),
	},
	{
		"b0o/incline.nvim",
		opts = require("plugins-options.incline"),
	},
	{
		"dhruvasagar/vim-zoom",
	},
}
