local M = {}

function M.setup()
	require("lspconfig").rust_analyzer.setup({
		on_attach = require("plugins-options.lsp.lspconfig").on_attach,
		capabilities = require("plugins-options.lsp.lspconfig").capabilities,
		settings = {
			["rust-analyzer"] = {
				diagnostics = {
					enable = true,
				},
			},
		},
	})
end

return M
