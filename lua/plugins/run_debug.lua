return {
	{
		"mfussenegger/nvim-dap",
		lazy = true,
	},
	{
		"igorlfs/nvim-dap-view",
		dependencies = {
			"mfussenegger/nvim-dap",
		},
		cmd = { "DapViewOpen" },
		---@module 'dap-view'
		---@type dapview.Config
		opts = {},
	},
	{
		"nvim-neotest/neotest",
		lazy = true,
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-neotest/neotest-jest",
			"arthur944/neotest-bun",
		},
		config = require("plugins.config.neotest").config,
	},
	{
		"chriswritescode-dev/consolelog.nvim",
		enabled = false,
		config = function()
			require("consolelog").setup()
		end,
	},
}
