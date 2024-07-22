return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		dependencies = { { "echasnovski/mini.icons", opts = {} } },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below

			spec = {

				{ "<leader>t", desc = "toggle" },
				{ "<leader><tab>", desc = "tabs" },
				{ "<leader>b", desc = "buffer" },
				{ "<leader>c", desc = "code" },
				{ "<leader>r", desc = "run/debug" },
				{ "<leader>f", desc = "file/find" },
				{ "<leader>g", desc = "git" },
				{ "<leader>q", desc = "quit/session" },
				{ "<leader>s", desc = "search" },
				{ "<leader>w", desc = "windows" },
				{ "<leader>x", desc = "diagnostics/quickfix" },
				{ "<leader>l", desc = "lsp" },
				{ "<leader>m", desc = "misc" },
			},
		},
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
