local M = {}

function M.setup()
	require("lspconfig").jdtls.setup({
		capabilities = require("plugins-options.lsp.servers-configs").capabilities,
	})
end

return M
