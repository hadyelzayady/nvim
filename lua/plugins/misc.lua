return {
	{
		"chrisgrieser/nvim-early-retirement",
		config = require("plugins-options.nvim-early-retirement").config,
		event = "VeryLazy",
	},
	{
		"echasnovski/mini.bufremove",
		version = false,
		event = "VeryLazy",
		config = require("plugins-options.mini-bufremove").config,
	},
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		event = "VeryLazy",
		config = require("plugins-options.toggleterm").config,
	},
	{
		"lambdalisue/suda.vim",
		cmd = { "SudaRead", "SudaWrite" },
	},
	{
		"jedrzejboczar/possession.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = require("plugins-options.possession").config,
	},
	{
		"gennaro-tedesco/nvim-possession",
		dependencies = {
			"ibhagwan/fzf-lua",
		},
		config = require("plugins-options.nvim-possession").config,
		enabled = false,
		init = function()
			local possession = require("nvim-possession")
			vim.keymap.set("n", "<leader>qsl", function()
				possession.list()
			end, { desc = "List Sessions" })
			vim.keymap.set("n", "<leader>qsn", function()
				possession.new()
			end, { desc = "New Session" })
			vim.keymap.set("n", "<leader>qsu", function()
				possession.update()
			end, { desc = "Update Session" })
			vim.keymap.set("n", "<leader>qsd", function()
				possession.delete()
			end, { desc = "Delete Session" })
		end,
	},
	{
		"echasnovski/mini.cursorword",
		version = false,
		event = "VeryLazy",
		config = require("plugins-options.mini-cursorword").config,
	},
}
