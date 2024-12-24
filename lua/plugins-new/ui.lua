return {
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
	-- {
	-- 	"stevearc/dressing.nvim",
	-- 	config = require("plugins-options.dressing").config,
	-- 	event = "VeryLazy",
	-- },
	-- {
	-- 	"MeanderingProgrammer/render-markdown.nvim",
	-- 	dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" }, -- if you use standalone mini plugins
	-- 	---@module 'render-markdown'
	-- 	---@type render.md.UserConfig
	-- 	opts = {},
	-- },
}
