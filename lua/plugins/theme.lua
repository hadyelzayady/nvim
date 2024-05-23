return {
	{
		"shaunsingh/moonlight.nvim",
		enabled = false,
		config = function()
			vim.cmd("colorscheme moonlight")
		end,
	},

	{
		"briones-gabriel/darcula-solid.nvim",
		dependencies = "rktjmp/lush.nvim",
		config = function()
			vim.cmd("colorscheme darcula-solid")
			vim.cmd("hi CursorLine guibg=#000000")
			vim.cmd("hi Visual guibg=#470000")
			-- vim.cmd("hi DiffChange guibg=#13401f")
			-- vim.cmd("hi DiffText guibg=#4d2a41")
		end,
	},
}
