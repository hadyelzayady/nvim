---@type vim.lsp.Config
return {
	cmd = { "cssmodules-language-server" },
	root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
	filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
}
