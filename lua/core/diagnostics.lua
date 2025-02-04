local M = {}

local diagnostic_utils = require("utils.lsp.diagnostics")
local diagnostic_icons = require("utils.ui-components").icons.diagnostics
M.virtual_text = {
	prefix = function(diagnostic)
		return diagnostic_icons[diagnostic_utils.diagnostic_key_icon_name_map[vim.diagnostic.severity[diagnostic.severity]]]
	end,
	spacing = 2,
}

M.float = {
	border = "rounded",
	source = true,
	-- Show severity icons as prefixes.
	prefix = function(diag)
		local level = diagnostic_utils.diagnostic_key_icon_name_map[vim.diagnostic.severity[diag.severity]]
		local prefix = string.format(" %s ", diagnostic_icons[level])
		return prefix, "Diagnostic" .. level:gsub("^%l", string.upper)
	end,
}

return M
