local M = {}

function M.setup()
  local diagnostic_icons = require("utils.ui-components").icons.diagnostics
	vim.diagnostic.config({
		virtual_text = {
			prefix = "",
			spacing = 2,
			format = function(diagnostic)
				local icon = diagnostic_icons[vim.diagnostic.severity[diagnostic.severity]]
				local message = vim.split(diagnostic.message, "\n")[1]
				return string.format("%s %s ", icon, message)
			end,
		},
		float = {
			border = "rounded",
			source = "if_many",
			-- Show severity icons as prefixes.
			prefix = function(diag)
				local level = vim.diagnostic.severity[diag.severity]
				local prefix = string.format(" %s ", diagnostic_icons[level])
				return prefix, "Diagnostic" .. level:gsub("^%l", string.upper)
			end,
		},
		-- Disable signs in the gutter.
		signs = false,
	})
end
return M
