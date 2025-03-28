local M = {}

local diagnostic_utils = require("utils.lsp.diagnostics")
local diagnostic_icons = require("utils.ui-components").icons.diagnostics

local virtual_text = {
	prefix = function(diagnostic)
		return diagnostic_icons[diagnostic_utils.diagnostic_key_icon_name_map[vim.diagnostic.severity[diagnostic.severity]]]
	end,
	spacing = 2,
}

local float = {
	border = "rounded",
	source = true,
	-- Show severity icons as prefixes.
	prefix = function(diag)
		local level = diagnostic_utils.diagnostic_key_icon_name_map[vim.diagnostic.severity[diag.severity]]
		local prefix = string.format(" %s ", diagnostic_icons[level])
		return prefix, "Diagnostic" .. level:gsub("^%l", string.upper)
	end,
}

local diagnostic = require("utils.diagnostics")

vim.diagnostic.config({
	virtual_text = virtual_text,
	severity_sort = true,
	float = float,
	-- Disable signs in the gutter.
	signs = false,
	virtual_lines = false,
	update_in_insert = false,
})
return M
