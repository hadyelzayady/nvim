return {
	{
		"mfussenegger/nvim-dap",
		lazy = true,
		config = require("plugins-options.nvim-dap").config,
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		config = require("plugins-options.nvim-dap-virtual-text").config,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = require("plugins-options.nvim-dap-ui").config,
	},
}
