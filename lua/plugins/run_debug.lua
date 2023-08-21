return {
	{
		"mfussenegger/nvim-dap",
		lazy = true,
		dependencies = { "theHamsta/nvim-dap-virtual-text" },
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap" },
		config = require("plugins-options.dap-ui").config,
		lazy = true,
	},
	{
		"mfussenegger/nvim-dap-python",
		ft = { "python" },
		dependencies = { "mfussenegger/nvim-dap" },
		config = require("plugins-options.dap-python").config,
		lazy = true,
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		opts = require("plugins-options.dap-virtual-text").opts,
		lazy = true,
	},
}
