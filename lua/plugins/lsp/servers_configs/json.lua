local M = {}

function M.setup()
	require("lspconfig").jsonls.setup({
		capabilities = require("plugins.lsp.servers_configs").capabilities,
		settings = {
			json = {
				schemas = require("schemastore").json.schemas({
					extra = {
						-- {
						-- 	description = "biome",
						-- 	fileMatch = { "biome.json" },
						-- 	name = "biome",
						-- 	url = "https://biomejs.dev/schemas/1.1.2/schema.json",
						-- },
					},
				}),
				validate = { enable = true },
			},
		},
	})
end

return M
