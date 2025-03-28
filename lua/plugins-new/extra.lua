return {

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		dependencies = {
			{ "echasnovski/mini.icons" },
		},
		opts = require("plugins-options.which-key").opts,
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
	{
		"folke/snacks.nvim",
		lazy = false,
		priority = 1000,
		---@type snacks.Config
		opts = {
			bigfile = { enabled = true },
			input = {
				position = "right",
				-- your input configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			},
			styles = {
				input = {
					relative = "cursor",
					row = -3,
					col = 0,
				},
			},
		},
	},
}
