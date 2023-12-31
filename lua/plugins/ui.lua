return {
	{
		"shellRaining/hlchunk.nvim",
		event = { "UIEnter" },
		opts = require("plugins-options.hlchunk"),
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
	},
	{
		"stevearc/dressing.nvim",
		opts = require("plugins-options.dressing"),
	},
	{
		"yaocccc/nvim-hlchunk",
		enabled = false,
		config = function()
			vim.cmd("source ~/.config/nvim/vimscript/hlchunk.vim")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		opts = require("plugins-options.lualine"),
	},
	{
		"b0o/incline.nvim",
		opts = require("plugins-options.incline"),
	},
	{
		"dhruvasagar/vim-zoom",
	},
	{
		"brenoprata10/nvim-highlight-colors",
		opts = require("plugins-options.nvim-highlight-colors"),
	},
	{
		"kevinhwang91/nvim-ufo",
		dependencies = {
			"kevinhwang91/promise-async",
			"neovim/nvim-lspconfig",
			"luukvbaal/statuscol.nvim",
		},
		opts = require("plugins-options.ufo").opts,
		config = function(_, opts)
			require("ufo").setup(opts)
			vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
			vim.keymap.set("n", "zm", require("ufo").closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = { "TodoTrouble", "TodoTelescope", "TodoQuickFix", "TodoLocList" },
		opts = require("plugins-options.todo-comments"),
		config = function(_, opts)
			require("todo-comments").setup(opts)
			require("config.keymaps").todo_comments()
		end,
	},
	{
		"folke/noice.nvim",
		-- opts = require("plugins-options.noice"),
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		config = function(_, opts)
			require("noice").setup(require("plugins-options.noice"))
		end,
	},
	{
		"willothy/veil.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
		},
		opts = require("plugins-options.veil").opts,
	},
	{
		"RRethy/vim-illuminate",
		config = require("plugins-options.vim-illuminate").config,
	},
	{
		"lewis6991/hover.nvim",
		config = require("plugins-options.hover").config,
	},
	{ "tiagovla/scope.nvim" },
}
