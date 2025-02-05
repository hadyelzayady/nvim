return {
	{
		"mfussenegger/nvim-dap",
		config = require("plugins-options.dap").config,
		dependencies = {
			{ "igorlfs/nvim-dap-view", opts = {} },
			"jay-babu/mason-nvim-dap.nvim",
		},
	},
}
