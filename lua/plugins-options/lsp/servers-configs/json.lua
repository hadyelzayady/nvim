local M = {}

function M.setup()
	require("lspconfig").jsonls.setup({
		capabilities = require("plugins-options.lsp.servers-configs").capabilities,
		settings = {
			json = {
				schemas = require("schemastore").json.schemas({
					extra = {
						{
							description = "biome",
							fileMatch = { "biome.json" },
							name = "biome",
							url = "https://biomejs.dev/schemas/1.4.1/schema.json",
						},
					},
				}),
				validate = { enable = true },
			},
		},
	})
end

return M
