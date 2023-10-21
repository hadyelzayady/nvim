return {
	{
		"echasnovski/mini.jump",
		version = false,
		config = require("plugins-options.mini-jump").config,
	},
	{
		"echasnovski/mini.jump2d",
		version = false,
		config = require("plugins-options.mini-jump2d").config,
	},
	{
		"ibhagwan/fzf-lua",
		-- optional for icon support
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
		config = function(_, opts)
			require("oil").setup(opts)
			require("config.keymaps").oil()
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		keys = {
			{ "<leader>e", "<cmd>Neotree reveal=true toggle=true<cr>", desc = "File Explorer Reveal" },
			{ "<leader>E", "<cmd>Neotree toggle=true<cr>", desc = "File Explorer" },
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
		opts = require("plugins-options.neotree").opts,
	},
	-- {
	-- 	"antosha417/nvim-lsp-file-operations",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-neo-tree/neo-tree.nvim",
	-- 	},
	-- },
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
