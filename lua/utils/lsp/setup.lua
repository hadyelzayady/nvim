local M = {}
function M.global_ignored()
	local bufnr = vim.api.nvim_get_current_buf()
	local file_path = vim.api.nvim_buf_get_name(bufnr)
	return file_path:find("/node_modules/") ~= nil
end

return M
