local M = {}

function M.config()
	require("lualine").setup({
		options = {
			icons_enabled = true,
			theme = "auto",
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			disabled_filetypes = {
				statusline = {},
				winbar = {},
			},
			ignore_focus = {},
			always_divide_middle = true,
			globalstatus = true,
			refresh = {
				statusline = 1000,
				tabline = 1000,
				winbar = 1000,
			},
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = {
				{ require("grapple").statusline, cond = require("grapple").exists },
				"branch",
				"diff",
				"diagnostics",
			},
			lualine_c = {
				"filename",
				{
					function()
						local package_info = require("package-info")
						return package_info.get_status()
					end,
				},
			},
			lualine_x = {
				"vim.fn['zoom#statusline']()",
				{
					function()
						local attach_clients = require("utils.lsp").get_buffer_attached_lsp()
						if #attach_clients > 0 then
							return "LSP(" .. #attach_clients .. ")"
						end
						return ""
					end,
				},
				"fileformat",
				"filetype",
			},
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { "filename" },
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {},
		winbar = {},
		inactive_winbar = {},
		extensions = {},
	})
end

return M
