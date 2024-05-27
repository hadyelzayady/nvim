return {
	{
		"projekt0n/github-nvim-theme",
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("github-theme").setup({
				options = {
					dim_inactive = true,
				},
			})
			vim.cmd("colorscheme  github_dark_tritanopia")
		end,
	},
}
