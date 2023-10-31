return {
	{
		"echasnovski/mini.jump",
		version = false,
		enabled = false,
		config = require("plugins-options.mini-jump").config,
	},
	{
		"echasnovski/mini.jump2d",
		version = false,
		config = require("plugins-options.mini-jump2d").config,
		enabled = false,
	},
	{
		"ibhagwan/fzf-lua",
		-- optional for icon support
		-- cmd = { "FzfLua" },
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
		cmd = { "NeoTree" },
		keys = {
			{ "<leader>e", "<cmd>Neotree reveal=true toggle=true<cr>", desc = "File Explorer" },
			{ "<leader>E", "<cmd>Neotree reveal<cr>", desc = "File Explorer Reveal" },
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
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {},
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
	},
	{
		"kevinhwang91/nvim-bqf",
		ft = "qf",
		dependencies = {
			{
				"junegunn/fzf",
				run = function()
					vim.fn["fzf#install"]()
				end,
			},
		},
	},
	{
		"folke/trouble.nvim",
		cmd = { "Trouble", "TroubleToggle" },
		-- opts = require("plugins-options.trouble"),
	},
	{
		"dnlhc/glance.nvim",
		cmd = { "Glance" },
		-- opts = require("plugins-options.glance"),
	},
}
