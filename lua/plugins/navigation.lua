return {
	{
		"ibhagwan/fzf-lua",
		cmd = "FzfLua",
		---@diagnostic disable-next-line: different-requires
		config = require("plugins.config.fzf-lua").config,
		dependencies = { "echasnovski/mini.icons" },
	},
	{
		"elanmed/fzf-lua-frecency.nvim",
		dependencies = { "ibhagwan/fzf-lua" },
		config = true,
	},

	{
		"dmtrKovalenko/fff.nvim",
		build = "cargo build --release",
		-- or if you are using nixos
		-- build = "nix run .#release",
		opts = {
			-- pass here all the options
		},
	},
	{
		"otavioschwanck/fzf-lua-enchanted-files",
		dependencies = { "ibhagwan/fzf-lua" },
		opts = {
			auto_history = true,
		},
	},
	{
		"ms-jpq/chadtree",
		build = "python3 -m chadtree deps",
		branch = "chad",
		event = "VeryLazy",
		config = require("plugins.config.chadtree").config,
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
		"stevearc/oil.nvim",
		cmd = { "Oil" },
		dependencies = { "echasnovski/mini.icons" },
		opts = require("plugins.config.oil").opts,
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
		event = "VeryLazy",
		version = "2.*",
		config = function()
			require("window-picker").setup({
				hint = "floating-big-letter",
			})
		end,
	},
	-- {
	-- 	"folke/flash.nvim",
	-- 	keys = require("plugins-options.flash").keys,
	-- 	config = require("plugins-options.flash").config,
	-- 	vscode = false,
	-- },
}
