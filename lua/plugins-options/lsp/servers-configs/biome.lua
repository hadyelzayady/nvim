local M = {}

function M.setup()
	require("lspconfig").biome.setup({
		capabilities = require("plugins-options.lsp.servers-configs").capabilities,
	})
end

return M
