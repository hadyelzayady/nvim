return {
	{
		"AnkushRoy-code/scribble.nvim",
		lazy = true,
		config = function()
			require("scribble").setup()
		end,
	},
	{
		"bullets-vim/bullets.vim",
		ft = { "markdown" },
	},
	{
		"chrisgrieser/nvim-origami",
		event = "VeryLazy",
		enabled = false,
		opts = {
			foldtext = {
				lineCount = {
					template = "---- %d lines -----", -- `%d` is replaced with the number of folded lines
					hlgroup = "Folded",
				},
			},
		},
		init = function()
			vim.opt.foldlevel = 99
			vim.opt.foldlevelstart = 99
		end,
	},
}
