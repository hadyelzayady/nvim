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
		cmd = { "Trouble", "TroubleToggle", "TroubleClose" },
		-- opts = require("plugins-options.trouble"),
	},
	{
		"dnlhc/glance.nvim",
		cmd = { "Glance" },
		-- opts = require("plugins-options.glance"),
	},
	{
		"chrishrb/gx.nvim",
		keys = { "gx" },
		dependencies = { "nvim-lua/plenary.nvim" },
		config = require("plugins-options.gx").config,
	},
	{
		"andymass/vim-matchup",
		event = "VeryLazy",
		config = function()
			vim.g.matchup_matchparen_deferred = 1 -- work async
			-- vim.g.matchup_matchparen_offscreen = {} -- disable status bar icon
			vim.g.matchup_matchparen_offscreen = { method = "popup" }
			vim.g.matchup_matchpref = {
				typescriptreact = {
					tagnameonly = 1,
				},
				javacriptreact = {
					tagnameonly = 1,
				},
				html = {
					tagnameonly = 1,
				},
			}
		end,
	},
}
