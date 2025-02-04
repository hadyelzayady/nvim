local border = {
	{ "🭽", "FloatBorder" },
	{ "▔", "FloatBorder" },
	{ "🭾", "FloatBorder" },
	{ "▕", "FloatBorder" },
	{ "🭿", "FloatBorder" },
	{ "▁", "FloatBorder" },
	{ "🭼", "FloatBorder" },
	{ "▏", "FloatBorder" },
}
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
	opts = opts or {}
	opts.border = opts.border or border
	return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- End Hover UI

-- Signs
for name in pairs(require("utils.ui-components").icons.diagnostics) do
	name = "DiagnosticSign" .. name
	vim.fn.sign_define(name, { text = "", texthl = name, numhl = name })
end

local diagnostic_key_icon_name_map = {
	ERROR = "Error",
	WARN = "Warn",
	HINT = "Hint",
	INFO = "Info",
}
local diagnostic_icons = require("utils.ui-components").icons.diagnostics
vim.diagnostic.config({
	virtual_text = {
		prefix = function(diagnostic)
			return diagnostic_icons[diagnostic_key_icon_name_map[vim.diagnostic.severity[diagnostic.severity]]]
		end,
		spacing = 2,
	},
	severity_sort = true,
	float = {
		border = "rounded",
		source = true,
		-- Show severity icons as prefixes.
		prefix = function(diag)
			local level = diagnostic_key_icon_name_map[vim.diagnostic.severity[diag.severity]]
			local prefix = string.format(" %s ", diagnostic_icons[level])
			return prefix, "Diagnostic" .. level:gsub("^%l", string.upper)
		end,
	},
	-- Disable signs in the gutter.
	signs = false,
	update_in_insert = false,
	virtual_lines = true,
})
