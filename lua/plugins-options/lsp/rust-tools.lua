local M = {}

function M.config(_)
	require("rust-tools").setup({
		server = {
			-- on_attach = require("") on_attach,
			capabilities = require("plugins-options.lsp.servers-configs").capabilities,
		},
	})
end

return M
