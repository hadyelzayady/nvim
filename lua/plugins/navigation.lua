return {
	{
		"ibhagwan/fzf-lua",
		-- cmd = "FzfLua",
		---@diagnostic disable-next-line: different-requires
		config = require("plugins.config.fzf-lua").config,
		dependencies = { "echasnovski/mini.icons" },
	},
	{
		"dmtrKovalenko/fff.nvim",
		build = function()
			-- this will download prebuild binary or try to use existing rustup toolchain to build from source
			-- (if you are using lazy you can use gb for rebuilding a plugin if needed)
			require("fff.download").download_or_build_binary()
		end,
		-- if you are using nixos
		-- build = "nix run .#release",
		opts = { -- (optional)
			debug = {
				enabled = true, -- we expect your collaboration at least during the beta
				show_scores = true, -- to help us optimize the scoring system, feel free to share your scores!
			},
		},
		-- No need to lazy-load with lazy.nvim.
		-- This plugin initializes itself lazily.
		lazy = false,
		keys = {
			{
				"ff", -- try it if you didn't it is a banger keybinding for a picker
				function()
					require("fff").find_files()
				end,
				desc = "FFFind files",
			},
			{
				"fg",
				function()
					require("fff").live_grep()
				end,
				desc = "LiFFFe grep",
			},
			{
				"fz",
				function()
					require("fff").live_grep({
						grep = {
							modes = { "fuzzy", "plain" },
						},
					})
				end,
				desc = "Live fffuzy grep",
			},
			{
				"fc",
				function()
					require("fff").live_grep({ query = vim.fn.expand("<cword>") })
				end,
				desc = "Search current word",
			},
		},
	},
	{
		"elanmed/fzf-lua-frecency.nvim",
		lazy = true,
		opts = {
			display_score = false,
			db_dir = vim.fs.joinpath(vim.fn.stdpath("data"), "fzf-lua-frecency"),
			stat_file = true,
		},
		config = function(_, opts)
			require("fzf-lua-frecency").setup(opts)
		end,
	},
	{
		"A7Lavinraj/fyler.nvim",
		dependencies = { "nvim-mini/mini.icons" },
		enabled = false,
		branch = "main",
		opts = {},
	},
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		cmd = { "NvimTreeToggle", "NvimTreeFindFile", "NvimTreeFindFileToggle" },
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = require("plugins.config.nvimtree").config,
	},
	{

		"chrishrb/gx.nvim",
		keys = { { "gx", "<cmd>Browse<cr>", mode = { "n", "x" } } },
		dependencies = { "nvim-lua/plenary.nvim" }, -- Required for Neovim < 0.10.0
		cmd = { "Browse" },
		submodules = false,
		opts = require("plugins.config.gx").opts,
	},
	{
		"echasnovski/mini.bufremove",
		version = false,
		event = "VeryLazy",
		config = true,
	},
	{
		"stevearc/aerial.nvim",
		opts = require("plugins.config.aerial").opts,
		cmd = { "AerialToggle", "AerialNavToggle" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		"stevearc/quicker.nvim",
		ft = "qf",
		config = true,
	},
	{
		"kevinhwang91/nvim-bqf",
		ft = "qf",
		opts = require("plugins.config.bqf").opts,
		dependencies = {
			{
				"junegunn/fzf",
				build = "./install --bin",
			},
		},
	},
	{
		"s1n7ax/nvim-window-picker",
		name = "window-picker",
		lazy = true,
		dependencies = { "nvim-tree/nvim-tree.lua" },
		version = "2.*",
		config = function()
			require("window-picker").setup({
				hint = "floating-big-letter",
			})
		end,
	},
}
