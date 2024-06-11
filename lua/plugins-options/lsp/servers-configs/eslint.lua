local M = {}

function M.setup()
	require("lspconfig").eslint.setup({
		capabilities = require("plugins-options.lsp.lspconfig").capabilities,
		on_attach = function(client, buffer)
			require("plugins-options.lsp.lspconfig").on_attach(client, buffer)
			client.server_capabilities.documentFormattingProvider = nil
		end,
	})
end

return M
