return {
	{
		"neovim/nvim-lspconfig",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
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
			"neovim/nvim-lspconfig",
			-- { "logrusx/nvim-java-core", branch = "migrate-to-official-mason-repo" },
			{ "mason-org/mason.nvim", opts = {} },
		},
		-- enabled = false,
		opts = {},
	},
	{
		"b0o/schemastore.nvim",
		ft = { "json", "yaml" },
	},
}
