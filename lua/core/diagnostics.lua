local diagnostic = require("utils.diagnostics")

vim.diagnostic.config({
	virtual_text = diagnostic.virtual_text,
	severity_sort = true,
	float = diagnostic.float,
	-- Disable signs in the gutter.
	signs = false,
	virtual_lines = false,
	update_in_insert = false,
})
