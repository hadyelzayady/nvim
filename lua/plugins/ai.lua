return {
	{
		"olimorris/codecompanion.nvim",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = require("plugins-options.codecompanion").config,
	},
	-- {
	--     "github/copilot.vim",
	--     cmd = "Copilot"
	-- }
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = {
					enabled = true,
					auto_trigger = true,
					keymap = {
						accept = "<Tab>", -- Accept suggestion
						next = "<C-n>", -- Next suggestion
						prev = "<C-p>", -- Previous suggestion
						dismiss = "<C-x>", -- Dismiss suggestion
					},
				},
			})
		end,
	},
}
