return {
	{
		"dnlhc/glance.nvim",
		cmd = { "Glance" },
		-- opts = require("plugins-options.glance"),
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
	{
		"ibhagwan/fzf-lua",
		cmd = { "FzfLua" },
		-- optional for icon support
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = require("plugins-options.fzf-lua").config,
	},
	{
		"folke/trouble.nvim",
		cmd = { "Trouble", "TroubleToggle", "TroubleClose" },
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
		"s1n7ax/nvim-window-picker",
		name = "window-picker",
		event = "VeryLazy",
		version = "2.*",
		config = function()
			require("window-picker").setup()
			require("config.keymaps").window_picker()
		end,
	},
	{
		"stevearc/oil.nvim",
		keys = {
			"-",
		},
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			delete_to_trash = true,
		},
		config = function(_, opts)
			require("oil").setup(opts)
			require("config.keymaps").oil()
		end,
	},
	{
		"MunsMan/kitty-navigator.nvim",
		keys = {
			{
				"<C-h>",
				function()
					require("kitty-navigator").navigateLeft()
				end,
				desc = "Move left a Split",
				mode = { "n" },
			},
			{
				"<C-j>",
				function()
					require("kitty-navigator").navigateDown()
				end,
				desc = "Move down a Split",
				mode = { "n" },
			},
			{
				"<C-k>",
				function()
					require("kitty-navigator").navigateUp()
				end,
				desc = "Move up a Split",
				mode = { "n" },
			},
			{
				"<C-l>",
				function()
					require("kitty-navigator").navigateRight()
				end,
				desc = "Move right a Split",
				mode = { "n" },
			},
		},
		build = function()
			vim.fn.system("cp", { "navigate_kitty.py", "~/.config/kitty" })
			vim.fn.system("cp", { "pass_keys.py", "~/.config/kitty" })
		end,
	},
	{
		"andymass/vim-matchup",
		event = "VeryLazy",
		config = require("plugins-options.matchup").config,
	},
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		event = "VeryLazy",
		config = require("plugins-options.harpoon").config,
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"cbochs/grapple.nvim",
		dependencies = {
			{ "nvim-tree/nvim-web-devicons", lazy = true },
			{ "nvim-telescope/telescope.nvim" },
		},
		cmd = { "Grapple" },
		config = require("plugins-options.grapple").config,
	},
	{
		"nvim-telescope/telescope.nvim",
		config = require("plugins-options.telescope").config,
		event = "VeryLazy",
	},
	{
		"Myzel394/jsonfly.nvim",
		config = require("plugins-options.jsonfly").config,
		keys = {
			{
				"<leader>sj",
				"<cmd>Telescope jsonfly<cr>",
				desc = "Open json(fly)",
				ft = { "json" },
				mode = "n",
			},
		},
	},
	{
		"ggandor/leap.nvim",
		config = require("plugins-options.leap").config,
		enabled = false,
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {},
  keys = {
  -- stylua: ignore
    { ",", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" }
    -- { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  }
,
	},
	{
		"danielfalk/smart-open.nvim",
		branch = "0.2.x",
		config = function()
			require("telescope").load_extension("smart_open")
		end,
		dependencies = {
			"kkharji/sqlite.lua",
			-- Only required if using match_algorithm fzf
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			-- Optional.  If installed, native fzy will be used when match_algorithm is fzy
			{ "nvim-telescope/telescope-fzy-native.nvim" },
		},
	},
	-- stylua: ignore
}
