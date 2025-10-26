return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		opts = require("plugins.config.copilot").opts,
	},
	{
		"olimorris/codecompanion.nvim",
		opts = require("plugins.config.codecompanion").opts,
		cmd = {
			"CodeCompanion",
			"CodeCompanionChat",
			"CodeCompanionActions",
			"CodeCompanionCmd",
			"CodeCompanionHistory",
			"CodeCompanionSummaries",
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"ravitemer/codecompanion-history.nvim",
		},
	},
}
