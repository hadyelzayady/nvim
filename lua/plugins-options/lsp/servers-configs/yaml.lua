local M = {}

function M.setup()
	require("lspconfig").yamlls.setup({
		capabilities = require("plugins-options.lsp.servers-configs").capabilities,
		settings = {
			yaml = {
				schemas = require("schemastore").yaml.schemas(),
				validate = { enable = true },
			},
		},
	})
end

return M
