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
---- Diagnostics
-- Signs
for name in pairs(require("utils.ui-components").icons.diagnostics) do
	name = "DiagnosticSign" .. name
	vim.fn.sign_define(name, { text = "", texthl = name, numhl = name })
end

vim.diagnostic.config({
	virtual_text = require("core.diagnostics").virtual_text,
	severity_sort = true,
	float = require("core.diagnostics").float,
	-- Disable signs in the gutter.
	signs = false,
	virtual_lines = false,
	update_in_insert = false,
})
