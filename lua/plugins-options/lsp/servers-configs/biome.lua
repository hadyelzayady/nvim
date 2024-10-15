local M = {}

function M.setup()
	require("lspconfig").biome.setup({
		cmd = { "bunx", "biome", "lsp-proxy" },
		on_attach = function(client)
			local plenary = require("plenary")
			local biome_path = plenary.path:new(vim.loop.cwd() .. "/biome.jsonc")
			local biome_path2 = plenary.path:new(vim.loop.cwd() .. "/biome.json")
			if not biome_path:exists() and not biome_path2:exists() then
				client.stop({ force = true })
			end
		end,
		capabilities = require("plugins-options.lsp.lspconfig").capabilities,
	})
end

return M
