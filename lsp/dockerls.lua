local roots = {
	"Dockerfile",
}
---@type vim.lsp.Config
return {
	cmd = { "docker-langserver", "--stdio" },
	root_dir = require("utils.lsp").root_dir(roots),
	filetypes = { "dockerfile" },
	single_file_support = true,
	settings = {
		docker = {
			languageserver = {
				formatter = {
					ignoreMultilineInstructions = true,
				},
			},
		},
	},
}
