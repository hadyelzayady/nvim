local M = {}

function M.setup()
	require("lspconfig").cssmodules_ls.setup({
		capabilities = require("plugins-options.lsp.servers-configs").capabilities,
	})
end

return M
