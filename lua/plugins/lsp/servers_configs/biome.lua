local M = {}

function M.setup()
	require("lspconfig").biome.setup({
		capabilities = require("plugins.lsp.servers_configs").capabilities,
	})
end

return M
