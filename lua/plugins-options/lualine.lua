local M = {}

function M.config()
	local icons = require("utils.ui-components").icons
	require("lualine").setup({
		options = {
			icons_enabled = true,
			theme = "auto",
			-- component_separators = { left = "", right = "" },
			-- section_separators = { left = "", right = "" },
			globalstatus = false,
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = {
				"branch",
				{
					"diff",
					symbols = { added = icons.git.added, modified = icons.git.modified, removed = icons.git.removed }, -- Changes the symbols used by the diff.
				},
			},
			lualine_c = {
				"filename",
			},
			lualine_x = {
				{
					function()
						local attach_clients = #vim.lsp.get_clients({ bufnr = 0 })
						if attach_clients > 0 then
							return "LSP(" .. attach_clients .. ")"
						end
						return ""
					end,
				},
				"diagnostics",
				"fileformat",
				"filetype",
			},
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
	})
end

return M
