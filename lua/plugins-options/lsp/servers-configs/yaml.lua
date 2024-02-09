local M = {}

function M.setup()
	require("lspconfig").yamlls.setup({
		capabilities = require("plugins-options.lsp.servers-configs").capabilities,
		handlers = {
			["textDocument/definition"] = function()
				require("utils.lsp.yaml").yaml_goto_definition()
			end,
		},
		settings = {
			yaml = {
				schemas = require("schemastore").yaml.schemas(),
				validate = { enable = true },
			},
		},
	})
end

return M
