---@type vim.lsp.Config
return {
	cmd = { "vscode-css-language-server", "--stdio" },
	root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
	filetypes = {
		"css", "scss", "less"
	},
	init_options = {
		hostInfo = "neovim",
	},
	settings = {
		css = {
			validate = true
		},
		less = {
			validate = true
		},
		scss = {
			validate = true
		}
	}
}
