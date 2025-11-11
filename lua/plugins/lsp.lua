return {
	{
		"neovim/nvim-lspconfig",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			-- "nvim-java/nvim-java" ,
			"yioneko/nvim-vtsls",
		},
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
		"b0o/schemastore.nvim",
		ft = { "json", "yaml" },
	},
	{
		"yioneko/nvim-vtsls",
	},
	{
		{
			"antosha417/nvim-lsp-file-operations",
			dependencies = {
				"nvim-lua/plenary.nvim",
				-- Uncomment whichever supported plugin(s) you use
				"nvim-tree/nvim-tree.lua",
				-- "nvim-neo-tree/neo-tree.nvim",
				-- "simonmclean/triptych.nvim"
			},
			config = function()
				require("lsp-file-operations").setup()
			end,
		},
	},
}
