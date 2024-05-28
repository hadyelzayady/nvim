local M = {}

function M.setup()
	require("lspconfig").dockerls.setup({})
end

return M
