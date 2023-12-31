return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			local npairs = require("nvim-autopairs")
			npairs.setup({
				disable_filetype = { "TelescopePrompt" },
				disable_in_macro = false, -- disable when recording or executing a macro
				disable_in_visualblock = false, -- disable hen insert after visual block mode
				ignored_next_char = [=[[%%%%'%[%"%.]]=],
				enable_moveright = true,
				enable_afterquote = true, -- add bracket pairs after quote
				enable_check_bracket_line = true, --- check bracket in same line
				enable_bracket_in_quote = true, --
				check_ts = false,
				map_bs = true,
				map_cr = true,
				fast_wrap = {
					map = "<M-e>",
					chars = { "{", "[", "(", '"', "'" },
					pattern = [=[[%'%"%>%]%)%}%,]]=],
					end_key = "$",
					keys = "qwertyuiopzxcvbnmasdfghjkl",
					check_comma = true,
					manual_position = true,
					highlight = "Search",
					highlight_grey = "Comment",
				},
			})
			-- local cmp_autopairs = require('nvim-autopairs.completion.cmp')
			-- local cmp = require('cmp')
			-- cmp.event:on(
			--   'confirm_done',
			--   cmp_autopairs.on_confirm_done()
			-- )
		end,
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function(_, opts)
			require("nvim-surround").setup(opts)
		end,
	},
	{
		"axelvc/template-string.nvim",
		ft = { "typescript", "javascript", "typescriptreact", "javascriptreact", "python" }, -- filetypes where the plugin is active
		opts = require("plugins-options.template-string"),
	},
	{ "tpope/vim-repeat", event = "VeryLazy" },
	{
		"Wansmer/treesj",
		keys = { "gs" },
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = require("plugins-options.treesj"),
	},
	{
		"smjonas/live-command.nvim",
		opts = require("plugins-options.live-command"),
		config = function(_, opts)
			require("live-command").setup(opts)
		end,
	},
	{
		"numToStr/Comment.nvim",
		event = "VeryLazy",
		opts = require("plugins-options.comment"),
	},
	{
		"saecki/crates.nvim",
		event = { "BufRead Cargo.toml" },
		dependencies = { { "nvim-lua/plenary.nvim" } },
		config = function()
			require("crates").setup()
		end,
	},
	{
		"windwp/nvim-ts-autotag",
	},
	{
		"kevinhwang91/nvim-fundo",
		dependencies = "kevinhwang91/promise-async",
		build = function()
			require("fundo").install()
		end,
		config = require("plugins-options.fundo").config,
	},
}
