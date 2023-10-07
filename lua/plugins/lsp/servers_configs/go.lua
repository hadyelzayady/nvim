local M = {}

function M.setup()
	require("lspconfig").gopls.setup({
		cmd = { "gopls" },
		capabilities = require("plugins.lsp.servers_configs").capabilities,
		on_attach = function(client, buffer)
			client.server_capabilities.documentFormattingProvider = nil
		end,
		settings = {
			gopls = {
				completeUnimported = true,
				usePlaceholders = true,
				analyses = {
					unusedparams = true,
				},
			},
		},
	})
end

return M
