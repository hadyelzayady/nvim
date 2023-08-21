return {
	{
		"mfussenegger/nvim-dap",
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap" },
		config = require("plugins-options.dap-ui").config,
	},
	{
		"mfussenegger/nvim-dap-python",
		ft = { "python" },
		dependencies = { "mfussenegger/nvim-dap" },
		config = require("plugins-options.dap-python").config,
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		dependencies = { "mfussenegger/nvim-dap" },
		opts = require("plugins-options.dap-virtual-text").opts,
	},
}
