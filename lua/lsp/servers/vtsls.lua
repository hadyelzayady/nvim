local M = {}
function M.setup()
	vim.lsp.config("vtsls", {
		capabilities = require("lsp.capabilities").capabilities,
	})
end
return M
