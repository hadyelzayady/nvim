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
	{
		"nvim-java/nvim-java",
		ft = { "java" },
		dependencies = {
			"nvim-java/lua-async-await",
			"nvim-java/nvim-java-refactor",
			"nvim-java/nvim-java-core",
			"nvim-java/nvim-java-test",
			"nvim-java/nvim-java-dap",
			"MunifTanjim/nui.nvim",
			"neovim/nvim-lspconfig",
			"mfussenegger/nvim-dap",
			{
				"williamboman/mason.nvim",
				opts = {
					registries = {
						"github:nvim-java/mason-registry",
						"github:mason-org/mason-registry",
					},
				},
			},
		},
		config = require("plugins-options.lsp.lsp-plugins.nvim-java").config,
	},
}
