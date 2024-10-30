return {
	{
		"mfussenegger/nvim-dap",
		config = require("plugins-options.dap").config,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = require("plugins-options.dap-ui").config,
	},
}
