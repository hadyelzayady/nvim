return {
	{
		"neovim/nvim-lspconfig",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "nvim-java/nvim-java" },
	},
	{
		"stevearc/conform.nvim",
		lazy = true,
		opts = require("plugins.config.conform").opts,
	},
	{
		"rmagatti/goto-preview",
		dependencies = { "rmagatti/logger.nvim" },
		event = "BufEnter",
		opts = require("plugins.config.goto-preview").opts,
		config = true, -- necessary as per https://github.com/rmagatti/goto-preview/issues/88
	},
	{
		"nvim-java/nvim-java",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
		},
		-- enabled = false,
		config = function()
			require("java").setup()
			require("lspconfig").jdtls.setup({})
            -- vim.lsp.enable("jdtls")
		end,
	},
	{
		"b0o/schemastore.nvim",
		ft = { "json", "yaml" },
	},
}
