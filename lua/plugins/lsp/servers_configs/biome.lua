local M = {}

function M.setup()
	require("lspconfig").biome.setup({
    cmd={ "biome", "lsp-proxy" },
		capabilities = require("plugins.lsp.servers_configs").capabilities,
		on_attach = function(client, buffer)
			client.server_capabilities.documentFormattingProvider = nil
			-- client.handlers["textDocument/definition"] = function(x, y)
			-- end
		end,
	})
end

return M
