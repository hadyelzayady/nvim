return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		config = require("plugins-options.lspconfig").config,
		dependencies = {
			"yioneko/nvim-vtsls",
		},
	},
	{
		"yioneko/nvim-vtsls",
		opts = require("plugins-options.vtsls"),
		config = function(_, opts)
			require("lspconfig.configs").vtsls = require("vtsls").lspconfig -- set default server config, optional but recommended
			require("vtsls").config(opts)
		end,
		dependencies = {
			"neovim/nvim-lspconfig",
		},
	},
	{
		"mhartington/formatter.nvim",
    enabled=false,
		cmd = { "Format", "FormatWrite", "FormatWriteLock", "FormatLock" },
		opts = require("plugins-options.formatter"),
  },
  {
    'stevearc/conform.nvim',
    lazy=true,
    opts = require("plugins-options.conform").opts
  },
  {
    "stevearc/aerial.nvim",
    opts = require("plugins-options.aerial"),
    lazy = true,
		cmd = { "AerialToggle", "AerialNavToggle" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		"roobert/action-hints.nvim",
		config = require("plugins-options.action-hints").config,
	},
	{
		"simrat39/rust-tools.nvim",
		config = require("plugins-options.rust-tools").config,
		dependencies = {
			"neovim/nvim-lspconfig",
		},
	},
	{
		"williamboman/mason.nvim",
		opts = require("plugins-options.mason"),
	},
	{
		"mfussenegger/nvim-jdtls",
		dependencies = {
			"neovim/nvim-lspconfig",
		},
	},
	{
		"b0o/schemastore.nvim",
	},
  {
    "mfussenegger/nvim-lint",
    config=require("plugins-options.nvim-lint").config
  }
}
