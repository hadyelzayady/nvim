return {
	{
		"neovim/nvim-lspconfig",
		config = require("plugins-options.lsp.lspconfig").config,
	},
	{
		"pmizio/typescript-tools.nvim",
		ft = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
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
		"zeioth/garbage-day.nvim",
    enabled=false,
		opts = {
			aggressive_mode = false,
			excluded_lsp_clients = {
				"jdtls",
			},
			grace_period = (60 * 5),
			wakeup_delay = 3000,
			notifications = false,
			retries = 5,
			timeout = 200,
		},
	},
}
