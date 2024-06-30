return {
	{
		"mfussenegger/nvim-dap",
		lazy = true,
		config = require("plugins-options.nvim-dap").config,
		dependencies = {
			{
				"microsoft/vscode-js-debug",
				version = "1.x",
				build = "npm i && npm run compile vsDebugServerBundle && mv dist out",
			},
		},
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
	{
		"nvim-neotest/neotest",
		config = require("plugins-options.neotest").config,
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-neotest/neotest-jest",
		},
	},
	{
		"tpope/vim-dispatch",
		config = function()
			-- vim.g.dispatch_handlers = {
			-- 	kitty = {"kitty @ new-window --cwd=%d %s"},
			-- }
			-- vim.g.dispatch_terminal = "kitty"
		end,
	},
}
