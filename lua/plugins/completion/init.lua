return {
	{
		"ms-jpq/coq_nvim",
		config = require("plugins-options.completion.coq").config,
		branch = "coq",
	},
	{
		"ms-jpq/coq.artifacts",
		branch = "artifacts",
		dependencies = { "ms-jpq/coq_nvim" },
	},
	{
		"ms-jpq/coq.thirdparty",
		branch = "3p",
		config = require("plugins-options.completion.coq").thirdparty,
		dependencies = { "ms-jpq/coq_nvim" },
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
