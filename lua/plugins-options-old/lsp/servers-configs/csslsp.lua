local M = {}

function M.setup()
	require("lspconfig").cssls.setup({
		capabilities = require("plugins-options.lsp.servers-configs").capabilities,
	})
end

return M
