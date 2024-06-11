local M = {}

function M.config(_, opts)
	require("plugins-options.lsp.servers-configs").setup()
	M.capabilities = require("cmp_nvim_lsp").default_capabilities()
	M.capabilities.textDocument.completion.completionItem.snippetSupport = true
end

function M.on_attach(client, bufnr)
	-- Disable semantic tokens
	if client.server_capabilities.semanticTokensProvider then
		client.server_capabilities.semanticTokensProvider = nil
	end

	-- Disable document highlights
	if client.server_capabilities.documentHighlightProvider then
		client.server_capabilities.documentHighlightProvider = false
	end
  -- Override handlers for semantic tokens and document highlights
  client.handlers["textDocument/semanticTokens/full"] = function() end
  client.handlers["textDocument/semanticTokens/full/delta"] = function() end
  client.handlers["textDocument/semanticTokens/range"] = function() end
  client.handlers["textDocument/documentHighlight"] = function() end
	-- client.server_capabilities.semanticTokensProvider = nil
	-- client.server_capabilities.documentHighlightProvider = nil
end

return M
