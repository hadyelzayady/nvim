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
		end,
	},
}
