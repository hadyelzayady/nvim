local roots = {
	"tsconfig.json",
	"jsconfig.json",
	"package.json",
	".git",
}
---@type vim.lsp.Config
return {
	cmd = { "cssmodules-language-server" },
	root_dir = require("utils.lsp").root_dir(roots),
	filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
}
