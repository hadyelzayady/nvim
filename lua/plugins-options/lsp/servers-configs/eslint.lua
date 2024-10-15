local M = {}

function M.setup()
	require("lspconfig").eslint.setup({
		capabilities = require("plugins-options.lsp.lspconfig").capabilities,
		on_attach = function(client, buffer)
			local plenary = require("plenary")
			local biome_path = plenary.path:new(vim.loop.cwd() .. "/biome.jsonc")
			biome_path:exists()
			if biome_path:exists() then
				client.stop({ force = true })
			end
			require("plugins-options.lsp.lspconfig").on_attach(client, buffer)
			client.server_capabilities.documentFormattingProvider = nil
		end,
	})
end

return M
