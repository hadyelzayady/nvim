return {
	{
		"neovim/nvim-lspconfig",
		dependencies = { "nvim-java/nvim-java" },
		lazy = false,
		config = function()
			require("lspconfig").jdtls.setup({})
		end,
	},
	{
		"nvim-java/nvim-java",
		lazy = false,
		config = function()
			require("java").setup()
		end,
	},
	{
		"antosha417/nvim-lsp-file-operations",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-tree.lua",
		},
		config = function()
			require("lsp-file-operations").setup()
		end,
	},
	{
		"chrisgrieser/nvim-dr-lsp",
		event = "LspAttach",
		opts = {},
	},
	{
		"Wansmer/symbol-usage.nvim",
		event = "LspAttach",
		config = require("plugins-options.symbole-usage").config,
	},
}
