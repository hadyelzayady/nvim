local M = {}
function M.setup()
	vim.lsp.config("vtsls", {
		cmd = { "bun", "run", "--bun", "vtsls","--stdio" },
		capabilities = require("lsp.capabilities").capabilities,
	})
end
return M
