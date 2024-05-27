local M = {}

function M.setup()
	require("lspconfig").eslint.setup({
		capabilities = require("plugins-options.lsp.lspconfig").capabilities,
		on_attach = function(client, buffer)
			client.server_capabilities.documentFormattingProvider = nil
		end,
	})
end

return M
