return {
	{
		"neovim/nvim-lspconfig",
		config = require("plugins-options.lsp.lspconfig").config,
	},
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		ft = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
		config = require("plugins-options.lsp.plugins.typescript-tools").config,
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
	},
	{
		"nanotee/sqls.nvim",
		ft = { "sql" },
	},
}
