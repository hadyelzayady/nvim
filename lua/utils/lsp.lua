local M = {}
function M.get_buffer_attached_lsp()
	local bufnr = vim.api.nvim_get_current_buf()
	local clients = vim.lsp.get_clients({ bufnr = bufnr })
	local c = {}
	for _, client in pairs(clients) do
		table.insert(c, client.name)
	end
	return c
end

return M
