local M = {}

function M.setup()
	vim.lsp.config("*", {
		capabilities = require("lsp.capabilities").capabilities,
	})
	require("lsp.servers.biome").setup()
	require("lsp.servers.json").setup()
	require("lsp.servers.postgres").setup()
	-- require("lsp.servers.ts_ls").setup()
	require("lsp.servers.eslint").setup()
	require("lsp.servers.vtsls").setup()
end

function M.addLspFileOperations()
	require("lsp.capabilities").addLspFileOperations()
	vim.lsp.config("*", {
		capabilities = require("lsp.capabilities"),
	})
end

return M
