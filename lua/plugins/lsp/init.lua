return {
	{
		"neovim/nvim-lspconfig",
		config = require("plugins-options.lsp.lspconfig").config,
	},
	{
		"antosha417/nvim-lsp-file-operations",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("lsp-file-operations").setup()
		end,
	},
	{
		"williamboman/mason.nvim",
		config = true,
		event = "VeryLazy",
		opts = {
			registries = {
				"github:nvim-java/mason-registry",
				"github:mason-org/mason-registry",
			},
		},
	},
	{
		"b0o/schemastore.nvim",
		ft = { "json", "yaml" },
	},
	{
		"j-hui/fidget.nvim",
		event = "VeryLazy",
		config = true,
	},
	{
		"nvim-java/nvim-java",
		config = require("plugins-options.lsp.plugins.nvim-java").config,
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
			"williamboman/mason.nvim",
		},
	},
	{
		"nanotee/sqls.nvim",
		ft = { "sql" },
	},
	{
		"yioneko/nvim-vtsls",
		ft = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
		config = require("plugins-options.lsp.plugins.nvim-vtsls").config,
	},
}
