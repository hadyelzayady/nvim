vim.api.nvim_create_user_command("LspAddMissingImports", function(args)
	local bufnr = vim.api.nvim_get_current_buf()
	local clients = vim.lsp.get_clients({ bufnr = bufnr, name = "ts_ls" })
	for index, value in ipairs(clients) do
		print(vim.inspect(value))
	end
end, { range = true })
