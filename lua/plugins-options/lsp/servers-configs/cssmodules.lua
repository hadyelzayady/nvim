local M = {}

function M.setup()
	require("lspconfig").cssmodules_ls.setup({
		on_attach = require("plugins-options.lsp.lspconfig").on_attach,
		capabilities = require("plugins-options.lsp.servers-configs").capabilities,
	})
end

return M
