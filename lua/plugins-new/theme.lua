return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
				dim_inactive = true, -- dims inactive windows
				on_colors = function(colors)
					colors.border = "#565f89"
					colors.bg_visual = "#53003c"
				end,
			})
			vim.cmd([[colorscheme tokyonight-night]])
			vim.cmd("highlight DiffAdd guibg=#283b4d guifg=#a7c080") -- Green for added lines
			vim.cmd("highlight DiffChange guibg=#2d3a53 guifg=#3e8fb0") -- Orange for changed lines
			vim.cmd("highlight DiffText guibg=#365474 guifg=#c678dd") -- Orange for changed lines
			vim.cmd("highlight DiffDelete guibg=#3c2c3e guifg=#e06c75") -- Red for removed lines		end,
			vim.cmd("highlight InclineNormal guibg=#431359")

			-- vim.cmd("highlight DiffAdd guibg=#002C2C guifg=#4EC9B0") -- Green for added lines
			-- vim.cmd("highlight DiffChange guibg=#003747 guifg=#FFA500") -- Orange for changed lines
			-- vim.cmd("highlight DiffDelete guibg=#2C002C guifg=#FF0000")
		end,
	},
}
