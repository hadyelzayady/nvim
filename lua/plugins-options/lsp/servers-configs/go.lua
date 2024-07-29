local M = {}

function M.setup()
	require("lspconfig").gopls.setup({
		on_attach = require("plugins-options.lsp.lspconfig").on_attach,
		capabilities = require("plugins-options.lsp.lspconfig").capabilities,
	})
end

return M
