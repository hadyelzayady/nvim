local M = {}

function M.config()
	require("java").setup()
	require("lspconfig").jdtls.setup({

		on_attach = function(client)
			client.server_capabilities.semanticTokensProvider = nil
			client.server_capabilities.documentHighlightProvider = nil
			-- vim.lsp.inlay_hint.enable(0, true)
		end,
	})
end

return M
