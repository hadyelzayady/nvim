return {
	{
		"ibhagwan/fzf-lua",
		-- optional for icon support
		dependencies = { "nvim-tree/nvim-web-devicons" },
		cmd = "FzfLua",
		opts = require("plugins-options.fzflua"),
		config = function(_, opts)
			-- calling `setup` is optional for customization
			require("fzf-lua").setup(opts)
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = require("plugins-options.telescope").dependencies,
		cmd = "Telescope",
		opts = require("plugins-options.telescope").opts,
	},
	{
		"dnlhc/glance.nvim",
		cmd = { "Glance" },
		opts = require("plugins-options.glance"),
	},
	{
		"nacro90/numb.nvim",
		opts = require("plugins-options.numb"),
	},
	{
		"ThePrimeagen/harpoon",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		keys = require("config.keymaps").harpoon_keys,
		opts = require("plugins-options.harpoon"),
	},
	{
		"rmagatti/goto-preview",
		keys = {
			{ "gp", desc = "Goto Preview" },
		},
		opts = require("plugins-options.goto-preview"),
		dependencies = { "nvim-telescope/telescope.nvim" },
		config = function(_, opts)
			require("goto-preview").setup(opts)
			require("config.keymaps").goto_preview_setup()
		end,
	},
	{
		"folke/trouble.nvim",
		cmd = { "Trouble", "TroubleToggle" },
		opts = require("plugins-options.trouble"),
	},
	{
		"kevinhwang91/nvim-bqf",
		dependencies = { {
			"junegunn/fzf",
			build = function()
				vim.fn["fzf#install"]()
			end,
		} },
	},
	{
		"chrishrb/gx.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		lazy = true,
		keys = {
			{ "gx", desc = "Goto link" },
		},
		opts = require("plugins-options.gx"),
	},
	{
		"phaazon/hop.nvim",
		branch = "v2", -- optional but strongly recommended
		opts = {
			keys = "etovxqpdygfblzhckisuran",
		},
		config = require("plugins-options.hop").config,
	},
	{
		"knubie/vim-kitty-navigator",
		build = "cp ./*.py ~/.config/kitty/",
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
}
