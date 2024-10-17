	return {
	{
		"stevearc/oil.nvim",
		cmd = { "Oil" },
		dependencies = {  "echasnovski/mini.icons" },
		config = require("plugins-options.oil").config,
	},
	{
		"chrishrb/gx.nvim",
		keys = { { "gx", "<cmd>Browse<cr>", mode = { "n", "x" } } },
		cmd = { "Browse" },
		init = function()
			vim.g.netrw_nogx = 1
		end,
		dependencies = { "nvim-lua/plenary.nvim" },
		config = require("plugins-options.gx").config,
  },
  {
    "ibhagwan/fzf-lua",
    dependencies = { 'echasnovski/mini.icons' },
    config = require("plugins-options.fzf-lua").config
  }

}
