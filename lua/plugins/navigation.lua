return {
	{
		"ibhagwan/fzf-lua",
		cmd = { "FzfLua" },
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = require("plugins-options.fzf-lua").config,
	},
	{
		"stevearc/oil.nvim",
		keys = {
			"-",
		},
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			delete_to_trash = true,
			default_file_explorer = true,
		},
		config = function(_, opts)
			require("oil").setup(opts)
			require("config.keymaps").oil()
		end,
	},
	{
		"kevinhwang91/nvim-bqf",
		ft = "qf",
		dependencies = {
			{
				"junegunn/fzf",
				build = function()
					vim.fn["fzf#install"]()
				end,
			},
		},
	},
	{
		"chrishrb/gx.nvim",
		keys = { { "gx", "<cmd>Browse<cr>", mode = { "n", "x" } } },
		cmd = { "Browse" },
		init = function()
			vim.g.netrw_nogx = 1 -- disable netrw gx
		end,
		dependencies = { "nvim-lua/plenary.nvim" },
		config = require("plugins-options.gx").config,
	},
	{
		"folke/trouble.nvim",
		cmd = { "Trouble", "TroubleToggle", "TroubleClose" },
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {},
		keys = {
			{
				",",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
			{
				"S",
				mode = { "n", "x", "o" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
			{
				"r",
				mode = "o",
				function()
					require("flash").remote()
				end,
				desc = "Remote Flash",
			},
			{
				"R",
				mode = { "o", "x" },
				function()
					require("flash").treesitter_search()
				end,
				desc = "Treesitter Search",
			},
			-- { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
		},
	},

	{
		"echasnovski/mini.bufremove",
		version = false,
		event = "VeryLazy",
		config = require("plugins-options.mini-bufremove").config,
	},

	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			"3rd/image.nvim",
		},
		config = require("plugins-options.neotree").config,
	},
}
