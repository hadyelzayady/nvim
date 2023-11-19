return {
	{
		"neovim/nvim-lspconfig",
		config = require("plugins-options.lsp.lspconfig").config,
	},
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		config = require("plugins-options.lsp.typescript-tools").config,
	},
	{
		"williamboman/mason.nvim",
		config = require("plugins-options.lsp.mason").config,
	},
	{
		"stevearc/conform.nvim",
		keys = { "<space>f" },
		config = require("plugins-options.lsp.conform").config,
	},
	{
		"rmagatti/goto-preview",
		keys = { "gp" },
		config = require("plugins-options.lsp.goto-preview").config,
	},
	{
		"stevearc/aerial.nvim",
		config = require("plugins-options.lsp.aerial").config,
		cmd = { "AerialToggle", "AerialNavToggle" },
		-- Optional dependencies
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		"hinell/lsp-timeout.nvim",
		dependencies = { "neovim/nvim-lspconfig" },
		enabled = false,
		config = function()
			vim.g.lspTimeoutConfig = {
				stopTimeout = 1000 * 60 * 2, -- ms, timeout before stopping all LSPs
				startTimeout = 0, -- ms, timeout before restart
				silent = false, -- true to suppress notifications
				filetypes = {
					ignore = { -- filetypes to ignore; empty by default
						-- lsp-timeout is disabled completely
					}, -- for these filetypes
				},
			}
		end,
	},
}
