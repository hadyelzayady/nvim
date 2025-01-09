---@type vim.lsp.Config
return {
	cmd = { "vscode-json-language-server", "--stdio" },
	root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
	filetypes = { "json", "jsonc" },
	init_options = {
		provideFormatter = true
	},
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
	single_file_support = true,
}
