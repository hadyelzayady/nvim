local M = {}

function M.format()
	local filetype_table = require("formatter.config").values.filetype
	if filetype_table[vim.bo.filetype] then
		return ":FormatWriteLock<cr>"
	else
		vim.lsp.buf.format({ async = true })
	end
end

return M
