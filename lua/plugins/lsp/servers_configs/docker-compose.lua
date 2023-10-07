local M = {}

function M.setup()
	require("lspconfig").docker_compose_language_service.setup({
		capabilities = require("plugins.lsp.servers_configs").capabilities,
	})
end

return M
