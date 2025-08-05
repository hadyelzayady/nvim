local M = {}

function M.setup()
	vim.lsp.config("*", {
		capabilities = require("lsp.capabilities"),
	})
	require("lsp.servers.biome").setup()
	require("lsp.servers.json").setup()
	require("lsp.servers.postgres").setup()
end
return M
