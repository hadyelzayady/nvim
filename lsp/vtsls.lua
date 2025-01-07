local util = require("utils.lsp.lspconfig")

---@type vim.lsp.Config
return {
	cmd = { "vtsls", "--stdio" },
	root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
	filetypes = {
		"javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx"
	},
	single_file_support = true,
	settings = {
		typescript = {
			updateImportsOnFileMove = "always",
		},
		javascript = {
			updateImportsOnFileMove = "always",
		},
		vtsls = {
			enableMoveToFileCodeAction = true,
		},
	},
}
