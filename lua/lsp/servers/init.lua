local M = {}

function M.setup()
	vim.lsp.config(
		"*",
		require("coq").lsp_ensure_capabilities({
			capabilities = require("lsp.capabilities"),
		})
	)
	require("lsp.servers.biome").setup()
end
return M
