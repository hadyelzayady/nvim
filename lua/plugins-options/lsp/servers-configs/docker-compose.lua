local M = {}

function M.setup()
	require("lspconfig").docker_compose_language_service.setup({
		capabilities = require("plugins-options.lsp.servers-configs").capabilities,
	})
end

return M
