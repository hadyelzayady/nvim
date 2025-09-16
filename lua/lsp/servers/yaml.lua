local M = {}

function M.setup()
	vim.lsp.config("yamlls", {
		settings = {
			yaml = {
				schemas = require("schemastore").yaml.schemas(),
				validate = { enable = true },
			},
		},
	})
end

return M
