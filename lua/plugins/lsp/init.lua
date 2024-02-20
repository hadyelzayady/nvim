return {
	{
		"neovim/nvim-lspconfig",
		event = "VeryLazy",
		config = require("plugins-options.lsp.lspconfig").config,
	},
	{
		"yioneko/nvim-vtsls",
		ft = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
		config = require("plugins-options.lsp.vtsls").config,
	},
	{
		"williamboman/mason.nvim",
		cmd = { "Mason", "MasonUpdate", "MasonInstall" },
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
		"mfussenegger/nvim-jdtls",
		ft = "java",
		enabled = true,
		-- config = require("plugins-options.lsp.servers-configs.jdtls").config,
		-- opts = require("plugins-options.lsp.servers-configs.jdtls").opts,
	},
	{
		"zeioth/garbage-day.nvim",
		enabled = false,
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
	{
		"b0o/schemastore.nvim",
	},
	{
		"mrcjkb/rustaceanvim",
		version = "^3", -- Recommended
		enabled = false,
		-- ft = { "rust" },
	},
	{
		"saecki/crates.nvim",
		ft = { "toml" },
		config = require("plugins-options.crates").config,
	},
	{
		"j-hui/fidget.nvim",
	},
	{
		"vuki656/package-info.nvim",
		dependencies = { "MunifTanjim/nui.nvim" },
		event = "VeryLazy",
		config = require("plugins-options.package-info").config,
	},
	-- {
	-- 	"nvim-java/nvim-java",
	-- 	ft = { "java" },
	-- 	config = require("plugins-options.lsp.java").config,
	-- 	dependencies = {
	-- 		"nvim-java/lua-async-await",
	-- 		"nvim-java/nvim-java-core",
	-- 		"nvim-java/nvim-java-test",
	-- 		"nvim-java/nvim-java-dap",
	-- 		"MunifTanjim/nui.nvim",
	-- 		"mfussenegger/nvim-dap",
	-- 	},
	-- },
	{
		"antosha417/nvim-lsp-file-operations",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-neo-tree/neo-tree.nvim",
		},
		config = function()
			require("lsp-file-operations").setup()
		end,
	},
}
