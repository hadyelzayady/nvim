local M = {}

function M.config(_, opts)
	require("plugins-options.lsp.servers-configs").setup()
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

return M
