local M = {}

function M.setup()
	require("lspconfig").pyright.setup({
		capabilities = require("plugins.lsp.servers_configs").capabilities,
		filetypes = { "python" },
	})
	require("lspconfig").ruff_lsp.setup({

		on_attach = function(client, bufnr)
			-- Disable hover in favor of Pyright
			client.server_capabilities.hoverProvider = false
		end,
	})
end

return M
