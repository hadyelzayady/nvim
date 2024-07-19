return {
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = require("plugins-options.nvim-tree").config,
	},
	{
		"ibhagwan/fzf-lua",
		cmd = { "FzfLua" },
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = require("plugins-options.fzf-lua").config,
	},
	{
		"stevearc/oil.nvim",
		cmd = { "Oil" },
		-- dependencies = { "nvim-tree/nvim-web-devicons" },
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
		config = require("plugins-options.oil").config,
	},
	{
		"kevinhwang91/nvim-bqf",
		ft = "qf",
		dependencies = { {
			"junegunn/fzf",
			build = function()
				vim.fn["fzf#install"]()
			end,
		} },
	},
	{
		"chrishrb/gx.nvim",
		keys = { { "gx", "<cmd>Browse<cr>", mode = { "n", "x" } } },
		cmd = { "Browse" },
		init = function()
			vim.g.netrw_nogx = 1
		end,
		dependencies = { "nvim-lua/plenary.nvim" },
		config = require("plugins-options.gx").config,
	},
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			-- {
			-- 	"<leader>cs",
			-- 	"<cmd>Trouble symbols toggle focus=false<cr>",
			-- 	desc = "Symbols (Trouble)",
			-- },
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
	{
		"folke/flash.nvim",
		keys = require("plugins-options.flash").keys,
		config = require("plugins-options.flash").config,
	},

	{
		"echasnovski/mini.bufremove",
		version = false,
		keys = { { "<space>d", desc = "Delete Buffer" }, { "<space>D", desc = "Force Delete Buffer" } },
		config = require("plugins-options.mini-bufremove").config,
	},
	{
		"dnlhc/glance.nvim",
		config = require("plugins-options.glance").config,
		cmd = { "Glance" },
	},
	{
		"stevearc/aerial.nvim",
		config = require("plugins-options.aerial").config,
		cmd = { "AerialToggle", "AerialNavToggle" },
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
	},
	{
		"s1n7ax/nvim-window-picker",
		name = "window-picker",
		event = "VeryLazy",
		version = "2.*",
		config = function()
			require("window-picker").setup()
		end,
	},
	{
		"RRethy/vim-illuminate",
		cmd = { "IlluminateToggle" },
		config = require("plugins-options.vim-illuminate").config,
	},
}
