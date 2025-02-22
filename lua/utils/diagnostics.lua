local M = {}

local diagnostic_icons = require("utils.ui-components").icons.diagnostics

M.diagnostic_key_icon_name_map = {
	ERROR = "Error",
	WARN = "Warn",
	HINT = "Hint",
	INFO = "Info",
}

M.virtual_text = {
	prefix = function(diagnostic)
		return diagnostic_icons[M.diagnostic_key_icon_name_map[vim.diagnostic.severity[diagnostic.severity]]]
	end,
	spacing = 2,
}

M.float = {
	border = "rounded",
	source = true,
	-- Show severity icons as prefixes.
	prefix = function(diag)
		local level = M.diagnostic_key_icon_name_map[vim.diagnostic.severity[diag.severity]]
		local prefix = string.format(" %s ", diagnostic_icons[level])
		return prefix, "Diagnostic" .. level:gsub("^%l", string.upper)
	end,
}

return M
