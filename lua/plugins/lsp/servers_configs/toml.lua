local M = {}

function M.setup()
	require("lspconfig").taplo.setup({
		capabilities = require("plugins.lsp.servers_configs").capabilities,
		on_attach = function(client, buffer)
			client.server_capabilities.documentFormattingProvider = nil
			-- client.handlers["textDocument/definition"] = function(x, y)
			-- end
		end,
	})
end

return M
