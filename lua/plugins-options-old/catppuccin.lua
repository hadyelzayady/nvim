local M = {}

function M.config()
	require("catppuccin").setup({
		dim_inactive = {
			enabled = true, -- dims the background color of inactive window
			shade = "dark",
			percentage = 0.15, -- percentage of the shade to apply to the inactive window
		},
		integrations = {
			cmp = false,
			gitsigns = true,
			nvimtree = false,
			treesitter = true,
			notify = false,
			mini = {
				enabled = true,
				-- indentscope_color = "",
			},
			-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
		},
	})

	-- setup must be called before loading
	vim.cmd.colorscheme("catppuccin")
end

return M
