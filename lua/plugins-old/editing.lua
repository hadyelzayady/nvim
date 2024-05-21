return {
	{
		"johmsalas/text-case.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
		config = function()
			require("textcase").setup({})
			require("telescope").load_extension("textcase")
		end,
		keys = {
			{ "ga" },
			{ "ga.", "<cmd>TextCaseOpenTelescope<CR>", mode = { "n", "v" }, desc = "Telescope" },
		},
	},
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
		"echasnovski/mini.splitjoin",
		version = false,
		keys = { "gs" },
		config = require("plugins-options.mini-splitjoin").config,
	},
	{
		"max397574/better-escape.nvim",
		event = "VeryLazy",
		config = require("plugins-options.better-escape").config,
	},
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
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
		"mg979/vim-visual-multi",
		branch = "master",
		keys = { "<C-n>" },
		--[[
        press n/N to get next/previous occurrence
        press [/] to select next/previous cursor
        press q to skip current and get next occurrence
        press Q to remove current cursor/selection
        start insert mode with i,a,I,A
        Two main modes:

        in cursor mode commands work as they would in normal mode
        in extend mode commands work as they would in visual mode
        press Tab to switch between «cursor» and «extend» mode
    --]]
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = require("plugins-options.nvim-autopairs").config,
	},
	{
		"echasnovski/mini.surround",
		version = false,
		config = require("plugins-options.mini-surround").config,
	},
	{
		"gaelph/logsitter.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},
	{
		"tpope/vim-repeat",
		event = "VeryLazy",
	},
}