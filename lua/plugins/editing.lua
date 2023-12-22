return {
	{
		"echasnovski/mini.ai",
		version = false,
		event = "VeryLazy",
		dependencies = {
			{
				"nvim-treesitter/nvim-treesitter-textobjects",
				init = function()
					-- no need to load the plugin, since we only need its queries
					require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
				end,
			},
		},
		config = require("plugins-options.mini-ai").config,
	},
	{
		"echasnovski/mini.align",
		enabled = false,
		version = false,
		config = require("plugins-options.mini-align").config,
	},
	{
		"echasnovski/mini.pairs",
		version = false,
		config = require("plugins-options.mini-pairs").config,
	},
	{
		"echasnovski/mini.splitjoin",
		version = false,
		config = require("plugins-options.mini-splitjoin").config,
	},
	{
		"echasnovski/mini.surround",
		version = false,
		config = require("plugins-options.mini-surround").config,
	},
	{
		"echasnovski/mini.comment",
		version = false,
		config = require("plugins-options.mini-comment").config,
	},
	{
		"max397574/better-escape.nvim",
		config = require("plugins-options.better-escape").config,
	},
	{
		"mbbill/undotree",
		cmd = { "UndotreeFocus", "UndotreeHide", "UndotreeShow", "UndotreeToggle" },
		config = function()
			vim.cmd("source ~/.config/nvim/vimscript/undotree.vim")
		end,
	},
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = require("plugins-options.refactoring").config,
	},
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	{
		"mg979/vim-visual-multi",
		branch = "master",
		{
			"johmsalas/text-case.nvim",
			dependencies = { "nvim-telescope/telescope.nvim" },
			-- Author's Note: If default keymappings fail to register (possible config issue in my local setup),
			-- verify lazy loading functionality. On failure, disable lazy load and report issue
			-- lazy = false,
			config = function()
				require("textcase").setup({})
				require("telescope").load_extension("textcase")
			end,
			keys = {
				{ "ga.", "<cmd>TextCaseOpenTelescope<CR>", mode = { "n", "v" }, desc = "Telescope" },
			},
		},
	},
}
