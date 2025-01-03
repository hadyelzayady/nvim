---@type vim.lsp.Config
return {
	cmd = { "typescript-language-server", "--stdio" },
	root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
	capabilities = vim.lsp.protocol.make_client_capabilities(),
	init_options = {
		hostInfo = "neovim",
	},
}
