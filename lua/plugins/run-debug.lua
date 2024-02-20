return {
	{
		"mfussenegger/nvim-dap",
		lazy = true,
		dependencies = { "theHamsta/nvim-dap-virtual-text" },
		event = "VeryLazy",
		config = require("plugins-options.dap").config,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap" },
		event = "VeryLazy",
		config = require("plugins-options.dap-ui").config,
		lazy = true,
	},
	{
		"nvim-neotest/neotest",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-neotest/neotest-jest",
		},
		config = require("plugins-options.neotest").config,
	},
}
