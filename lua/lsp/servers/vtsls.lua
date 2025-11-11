local M = {}
function M.setup()
	vim.lsp.config("vtsls", {
		capabilities = require("lsp.capabilities"),
	})
end
return M
