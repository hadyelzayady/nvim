return {
	{
		"neovim/nvim-lspconfig",
		event = "VeryLazy",
		config = require("plugins-options.lsp.lspconfig").config,
		dependencies = {
			"dnlhc/glance.nvim",
		},
	},
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		ft = { "javascript", "typescript", "typescriptreact", "javascriptreact" },
		config = require("plugins-options.lsp.lsp-plugins.typescript-tools").config,
	},
	{
		"williamboman/mason.nvim",
		config = require("plugins-options.lsp.lsp-plugins.mason").config,
		event = "VeryLazy",
	},

	{
		"j-hui/fidget.nvim",
		version = "^1.4.1",
		config = true,
	},

	{
		"b0o/schemastore.nvim",
	},
	{
		"stevearc/aerial.nvim",
		config = require("plugins-options.lsp.lsp-plugins.aerial").config,
		cmd = { "AerialToggle", "AerialNavToggle" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		"rmagatti/goto-preview",
		keys = { "gp" },
		config = require("plugins-options.lsp.lsp-plugins.goto-preview").config,
	},

	{
		"stevearc/conform.nvim",
		keys = { "<space>f" },
		config = require("plugins-options.conform").config,
	},
}
