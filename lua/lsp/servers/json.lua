local M = {}

function M.setup()
	vim.lsp.config("json", {

		settings = {
			json = {
				schemas = require("schemastore").json.schemas({
					extra = {
						{
							description = "biome",
							fileMatch = { "biome.json" },
							name = "biome",
							url = "https://biomejs.dev/schemas/1.9.4/schema.json",
						},
					},
				}),
				validate = { enable = true },
			},
		},
	})
end

return M
