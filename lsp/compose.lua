local roots = {
	"docker-compose.yml",
	"docker-compose.yaml",
}
return {
	cmd = { "docker-compose-langserver", "--stdio" },
	root_dir = require("utils.lsp").root_dir(roots),
	filetypes = { "yaml.docker-compose" },
	-- handlers = {
	-- 	["textDocument/definition"] = function()
	-- 		require("utils.lsp.handlers.yaml").yaml_goto_definition()
	-- 	end,
	-- },
	single_file_support = true,
}
