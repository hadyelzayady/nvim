local M = {}

function M.setup()
	local coq = require("coq") -- add this
	require("lspconfig").biome.setup(coq.lsp_ensure_capabilities({
		cmd = { "npx", "biome", "lsp-proxy" },
		on_attach = function(client)
			local plenary = require("plenary")
			local biome_path = plenary.path:new(vim.loop.cwd() .. "/biome.json")
			biome_path:exists()
			if not biome_path:exists() then
				client.stop({ force = true })
			end
		end,
		capabilities = require("plugins-options.lsp.servers-configs").capabilities,
	}))
end

return M
