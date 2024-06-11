local M = {}

function M.setup()
	require("lspconfig").docker_compose_language_service.setup({
		on_attach = require("plugins-options.lsp.lspconfig").on_attach,
		capabilities = require("plugins-options.lsp.servers-configs").capabilities,
	})
end

return M
