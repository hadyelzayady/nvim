local M = {}

function M.config()
	local helpers = require("incline.helpers")
	require("incline").setup({
		window = {
			padding = 0,
			margin = { horizontal = 0 },
		},
		render = function(props)
			local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
			local ft_icon, ft_color = require("nvim-web-devicons").get_icon_color(filename)
			local modified = vim.bo[props.buf].modified
			local buffer = {
				ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or "",
				" ",
				{ modified and "[+]" .. filename or filename, gui = modified and "bold,italic" or "bold" },
				" ",
				guibg = "#44406e",
			}
			-- return { { get_diagnostic_label() }, { buffer } }
			return {{ buffer } }
		end,
	})
end

return M
