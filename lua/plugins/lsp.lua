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
		keys = { "gpd", "gpr", "gpi" },
		opts = require("plugins.config.goto-preview").opts,
		config = true, -- necessary as per https://github.com/rmagatti/goto-preview/issues/88
	},
	{
		"b0o/schemastore.nvim",
		ft = { "json", "yaml" },
	},
	{
		"yioneko/nvim-vtsls",
		enabled = true,
		ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
	},
	{
		"mfussenegger/nvim-jdtls",
		ft = { "java" },
		dependencies = { { "mason-org/mason.nvim", opts = {}, dependencies = { "ibhagwan/fzf-lua" } } },
	},
	{
		"JavaHello/spring-boot.nvim",
		ft = { "java", "yaml", "jproperties" },
		dependencies = {
			"mfussenegger/nvim-jdtls", -- or nvim-java, nvim-lspconfig
			"ibhagwan/fzf-lua", -- 可选，用于符号选择等UI功能。也可以使用其他选择器（例如 telescope.nvim）。
		},
		opts = {},
	},
	{
		"antosha417/nvim-lsp-file-operations",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-tree.lua",
		},
		lazy = true,
		config = function()
			require("lsp-file-operations").setup()
			require("lsp.servers").addLspFileOperations()
		end,
	},
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		enabled = false,
		opts = {},
	},
	{
		"idelice/nvim-jls",
		opts = {
			jls_dir = "/Users/hadyelzayady/JLS",
		},
	},
}
