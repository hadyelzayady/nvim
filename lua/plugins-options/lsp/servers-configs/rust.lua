local M = {}

function M.setup()
	require("lspconfig").rust_analyzer.setup({
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
