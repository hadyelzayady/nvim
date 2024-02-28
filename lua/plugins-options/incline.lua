local M = {}

function M.config()
	local helpers = require("incline.helpers")
	require("incline").setup({
		window = {
			padding = 0,
			margin = { horizontal = 0 },
		},
		render = function(props)
			local function get_diagnostic_label()
				local label = {}

				for severity, icon in pairs(require("utils.ui-components").icons.diagnostics) do
					local n =
						#vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
					if n > 0 then
						table.insert(label, { icon .. n .. " ", group = "DiagnosticSign" .. severity })
					end
				end
				if #label > 0 then
					table.insert(label, { "┊ " })
				end
				return label
			end
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
			return { { get_diagnostic_label() }, { buffer } }
		end,
	})
end

return M
