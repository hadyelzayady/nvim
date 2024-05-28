local M = {}

function M.config()
	require("typescript-tools").setup({
		-- spawn additional tsserver instance to calculate diagnostics on it
		separate_diagnostic_server = true,
		-- "change"|"insert_leave" determine when the client asks the server about diagnostic
		publish_diagnostic_on = "insert_leave",
		tsserver_plugins = {
			"@styled/typescript-styled-plugin",
		},
		jsx_close_tag = {
			enable = true,
			filetypes = { "javascriptreact", "typescriptreact" },
		},
	})

	require("lspconfig")["typescript-tools"].setup({
		on_attach = function(client)
			-- client.server_capabilities.semanticTokensProvider = nil
			client.server_capabilities.documentHighlightProvider = nil
		end,
	})
end

return M
