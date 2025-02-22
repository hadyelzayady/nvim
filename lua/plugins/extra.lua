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
}
