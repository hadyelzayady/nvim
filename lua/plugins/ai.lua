return {
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
						next = "<C-j>", -- Next suggestion
						prev = "<C-k>", -- Previous suggestion
						dismiss = "<C-x>", -- Dismiss suggestion
					},
				},
			})
		end,
	},
	{
		"olimorris/codecompanion.nvim",
		opts = {},
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
	},
}
