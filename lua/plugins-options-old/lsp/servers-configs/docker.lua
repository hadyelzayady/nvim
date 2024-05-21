local M = {}

function M.setup()
	require("lspconfig").dockerls.setup({
		single_file_support = true,
		capabilities = require("plugins-options.lsp.servers-configs").capabilities,
	})
end

return M
