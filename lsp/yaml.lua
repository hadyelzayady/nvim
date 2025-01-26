---@type vim.lsp.Config
return {
	cmd = { "yaml-language-server", "--stdio" },
	root_markers = { ".git" },
	filetypes = { "yaml", "yaml.docker-compose", "yaml.gitlab" },
	init_options = {
		provideFormatter = true,
	},
	-- handlers = {
	-- 	["textDocument/definition"] = function()
	-- 		require("utils.lsp.handlers.yaml").yaml_goto_definition()
	-- 	end,
	-- },
	settings = {
		redhat = {
			telemetry = {
				enabled = false,
			},
		},
		yaml = {
			schemas = require("schemastore").yaml.schemas(),
			validate = { enable = true },
		},
	},
	single_file_support = true,
}
