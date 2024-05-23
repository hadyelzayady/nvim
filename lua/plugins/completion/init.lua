return {
	{
		"ms-jpq/coq_nvim",
		branch = "coq",
		enabled = false,
		dependencies = {
			{ "ms-jpq/coq.artifacts", branch = "artifacts" },
			{ "ms-jpq/coq.thirdparty", branch = "3p" },
		},
		init = function()
			print("hhhhhhhhhhh")
			local remap = vim.api.nvim_set_keymap
			local npairs = require("nvim-autopairs")
			-- skip it, if you use another global object
			_G.MUtils = {}
			MUtils.CR = function()
				if vim.fn.pumvisible() ~= 0 then
					if vim.fn.complete_info({ "selected" }).selected ~= -1 then
						return npairs.esc("<c-y>")
					else
						return npairs.esc("<c-e>") .. npairs.autopairs_cr()
					end
				else
					return npairs.autopairs_cr()
				end
			end
			remap("i", "<cr>", "v:lua.MUtils.CR()", { expr = true, noremap = true })

			MUtils.BS = function()
				if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ "mode" }).mode == "eval" then
					return npairs.esc("<c-e>") .. npairs.autopairs_bs()
				else
					return npairs.autopairs_bs()
				end
			end
			remap("i", "<bs>", "v:lua.MUtils.BS()", { expr = true, noremap = true })

			vim.g.coq_settings = {
				keymap = { recommended = false },
				auto_start = true,
				display = {
					preview = {
						positions = { east = 1, north = 2, south = 3, west = 4 },
					},
					pum = {
						fast_close = false,
						x_max_len = 50,
						x_truncate_len = 12,
					},
				},
			}
		end,
	},
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
		config = function()
			require("chatgpt").setup()
		end,
		cmd = {
			"ChatGPT",
			"ChatGPTActAs",
			"ChatGPTCompleteCode",
			"ChatGPTEditWithInstructions",
			"ChatGPTRun",
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	},
}
