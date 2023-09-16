local M = {}

function M.setup()
	require("lspconfig").yamlls.setup({
		capabilities = require("plugins.lsp.servers_configs").capabilities,
		settings = {
			yaml = {
				schemaStore = {
					-- You must disable built-in schemaStore support if you want to use
					-- this plugin and its advanced options like `ignore`.
					enable = false,
					-- Avoid TypeError: Cannot read properties of undefined (reading 'length')
					url = "",
				},
				schemaDownload = { enable = true },
				schemas = require("schemastore").json.schemas({
					extra = {
						{
							description = "OpenApi",
							fileMatch = { "*.openapi.yaml", "openapi*.yaml" },
							name = "OpenApi",
							url = "https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.0/schema.json",
						},
					},
				}),
			},
		},
	})
end

return M
