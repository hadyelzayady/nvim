local M = {}

local diagnostic_icons = require("utils.ui-components").icons.diagnostics

M.severity_to_text_map = {
	[vim.diagnostic.severity.ERROR] = "Error",
	[vim.diagnostic.severity.WARN] = "Warn",
	[vim.diagnostic.severity.INFO] = "Info",
	[vim.diagnostic.severity.HINT] = "Hint",
}

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

function M.toggle_current_line()
	local virtual_text = vim.diagnostic.config().virtual_text
	local virtual_lines = vim.diagnostic.config().virtual_lines
	if virtual_text then
		if type(virtual_text) == "table" then
			virtual_text.current_line = not virtual_text.current_line
			vim.diagnostic.config({ virtual_text = virtual_text })
		end
	else
		if virtual_lines then
			if type(virtual_lines) == "table" then
				virtual_lines.current_line = not virtual_lines.current_line
				vim.diagnostic.config({ virtual_lines = virtual_lines })
			end
		end
	end
end
function M.toggle_virtual_lines()
	local virtual_text = vim.diagnostic.config().virtual_text
	local virtual_lines = vim.diagnostic.config().virtual_lines
	if virtual_text then
		vim.diagnostic.config({ virtual_text = false, virtual_lines = { current_line = virtual_text.current_line } })
	else
		if virtual_lines then
			local new_virtual_text =
				vim.tbl_extend("force", M.virtual_text, { current_line = virtual_lines.current_line })
			vim.diagnostic.config({ virtual_text = new_virtual_text, virtual_lines = false })
		end
	end
end
return M
