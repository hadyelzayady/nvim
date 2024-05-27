local M = {}

function M.config()
	require("typescript-tools").setup({})

	require("lspconfig")["typescript-tools"].setup({
		on_attach = function(client)
			client.server_capabilities.semanticTokensProvider = false
			client.server_capabilities.documentHighlightProvider = false
		end,
	})
end

return M
