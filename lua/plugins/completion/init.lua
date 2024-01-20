return {
	{
		"hrsh7th/nvim-cmp",
		config = require("plugins-options.completion.cmp").config,
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-calc",
			"saadparwaiz1/cmp_luasnip",
			"David-Kunz/cmp-npm",
		},
	},
	{
		"petertriho/cmp-git",
		lazy = true,
		ft = { "gitcommit" },
		dependencies = {
			"hrsh7th/nvim-cmp",
		},
	},
	{
		"David-Kunz/cmp-npm",
		-- lazy = true,
		ft = "json",
		config = function()
			require("cmp-npm").setup({})
		end,
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	{
		"petertriho/cmp-git",
		dependencies = {
			"hrsh7th/nvim-cmp",
			"nvim-lua/plenary.nvim",
		},
		config = require("plugins-options.completion.cmp-git").config,
	},
	{
		"davidsierradz/cmp-conventionalcommits",
		lazy = true,
		dependencies = {
			"hrsh7th/nvim-cmp",
		},
	},
	{
		"Exafunction/codeium.vim",
		event = { "InsertEnter" },
		config = function()
			require("config.keymaps").codium()
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		build = "make install_jsregexp",
		dependencies = {
			"rafamadriz/friendly-snippets",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
		},
		keys = {
			{
				"<tab>",
				function()
					return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
				end,
				expr = true,
				silent = true,
				mode = "i",
			},
			{
				"<tab>",
				function()
					require("luasnip").jump(1)
				end,
				mode = "s",
			},
			{
				"<s-tab>",
				function()
					require("luasnip").jump(-1)
				end,
				mode = { "i", "s" },
			},
		},
		config = require("plugins-options.completion.luasnip").config,
	},
	{
		"jackMort/ChatGPT.nvim",
		event = "VeryLazy",
		config = function()
			require("chatgpt").setup()
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	},
}
