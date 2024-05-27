local M = {}

function M.config()
	require("lualine").setup({
		options = {
			icons_enabled = true,
			theme = "horizon",
			-- component_separators = { left = "", right = "" },
			-- section_separators = { left = "", right = "" },
			globalstatus = false,
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = {
				"branch",
				"diff",
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
