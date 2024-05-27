local M = {}

function M.setup()
	require("lspconfig").biome.setup({
		cmd = { "npx", "biome", "lsp-proxy" },
		on_attach = function(client)
			local plenary = require("plenary")
			local biome_path = plenary.path:new(vim.loop.cwd() .. "/biome.json")
			biome_path:exists()
			if not biome_path:exists() then
				client.stop({ force = true })
			end
		end,
		capabilities = require("plugins-options.lsp.lspconfig").capabilities,
	})
end

return M
