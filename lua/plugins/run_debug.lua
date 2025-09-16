return {
	{
		"mfussenegger/nvim-dap",
	},
	{
		"igorlfs/nvim-dap-view",
		dependencies = {
			"mfussenegger/nvim-dap",
		},
		---@module 'dap-view'
		---@type dapview.Config
		opts = {},
	},
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-neotest/neotest-jest",
			"arthur944/neotest-bun",
		},
		config = require("plugins.config.neotest").config,
	},
}
