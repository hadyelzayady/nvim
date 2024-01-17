local M = {}

function M.config()
	require("java").setup()
	require("plugins-options.lsp.servers-configs.jdtls").setup()
end

return M
