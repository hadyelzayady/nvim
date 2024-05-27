local M = {}

function M.config()
	require("typescript-tools").setup({})

	require("lspconfig")["typescript-tools"].setup({
		on_attach = function(client)
			client.server_capabilities.semanticTokensProvider = nil
			client.server_capabilities.documentHighlightProvider = nil
		end,
	})
end

return M
