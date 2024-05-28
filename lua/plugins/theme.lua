return {
	{
		"projekt0n/github-nvim-theme",
		priority = 1000, -- make sure to load this before all the other start plugins
		enabled = false,
		config = function()
			require("github-theme").setup({
				options = {
					dim_inactive = true,
				},
			})
			vim.cmd("colorscheme  github_dark_tritanopia")
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		enabled = false,
		config = function()
			vim.o.background = "dark"
			-- Default options:
			require("gruvbox").setup({
				terminal_colors = true, -- add neovim terminal colors
				undercurl = true,
				underline = true,
				bold = true,
				italic = {
					strings = true,
					emphasis = true,
					comments = true,
					operators = false,
					folds = true,
				},
				strikethrough = true,
				invert_selection = false,
				invert_signs = false,
				invert_tabline = false,
				invert_intend_guides = false,
				inverse = true, -- invert background for search, diffs, statuslines and errors
				contrast = "", -- can be "hard", "soft" or empty string
				palette_overrides = {},
				overrides = {},
				dim_inactive = true,
				transparent_mode = false,
			})
			vim.cmd("colorscheme gruvbox")
		end,
	},

	{
		"shaunsingh/nord.nvim",
		priority = 1000,
		enabled = false,
		config = function()
			-- Example config in lua
			vim.g.nord_contrast = false
			vim.g.nord_borders = true
			vim.g.nord_disable_background = true
			vim.g.nord_italic = false
			vim.g.nord_uniform_diff_background = false
			vim.g.nord_bold = false

			-- Load the colorscheme
			require("nord").set()
		end,
	},

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
			vim.cmd("highlight DiffAdd guibg=#0d4f3d") -- Green for added lines
			vim.cmd("highlight DiffChange guibg=#524a07") -- Orange for changed lines
			vim.cmd("highlight DiffText guifg=#bea9de gui=underline") -- Orange for changed lines
			vim.cmd("highlight DiffDelete guibg=#2C002C") -- Red for removed lines		end,

			-- vim.cmd("highlight DiffAdd guibg=#002C2C guifg=#4EC9B0") -- Green for added lines
			-- vim.cmd("highlight DiffChange guibg=#003747 guifg=#FFA500") -- Orange for changed lines
			-- vim.cmd("highlight DiffDelete guibg=#2C002C guifg=#FF0000")
		end,
	},
}
