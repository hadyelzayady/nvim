return {
	{
		"b0o/schemastore.nvim",
		ft = { "json", "yaml" },
	},
	{
		"mrcjkb/rustaceanvim",
		version = "^6", -- Recommended
		lazy = false, -- This plugin is already lazy
	},
	{
		"nvim-java/nvim-java",
		lazy = false,
		config = require("plugins-options.nvim-java").config,
		dependencies = { "neovim/nvim-lspconfig" },
	},
	{
		"rmagatti/goto-preview",
		dependencies = { "rmagatti/logger.nvim" },
		config = require("plugins-options.goto-preview").config,
	},
}
