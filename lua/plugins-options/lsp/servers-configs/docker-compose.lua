local M = {}

function M.setup()
	require("lspconfig").docker_compose_language_service.setup({})
end

return M
