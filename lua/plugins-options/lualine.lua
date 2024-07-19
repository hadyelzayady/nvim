local M = {}

function M.config()
	local icons = require("utils.ui-components").icons
	require("lualine").setup({
		options = {
			icons_enabled = true,
			theme = "auto",
			-- component_separators = { left = "", right = "" },
			-- section_separators = { left = "", right = "" },
			globalstatus = true,
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
				{
					"filename",
					path = 1,
				},
			},
			lualine_x = {
				"vim.fn['zoom#statusline']()",
				{
					function()
						local current_buf = vim.api.nvim_get_current_buf()
						local formatters = require("plugins-options.conform").get_buffer_active_formatter()
						return "[" .. table.concat(formatters, ",") .. "]"
					end,
				},
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
