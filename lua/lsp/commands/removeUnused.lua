vim.api.nvim_create_user_command("LspRemoveUnusedImports", function(args)
	local bufnr = vim.api.nvim_get_current_buf()
	local params = vim.lsp.util.make_range_params(0, "utf-8")
	local clients = vim.lsp.get_clients({ bufnr })
	for _, client in ipairs(clients) do
		if client.name == "ts_ls" then
			params.context = { only = { "source.removeUnusedImports.ts" } }
			require("lsp.commands.utils").executeBufferCodeAction(client, params)
		end
	end
end, { range = true })
vim.api.nvim_create_user_command("LspRemoveUnused", function(args)
	local bufnr = vim.api.nvim_get_current_buf()
	local params = vim.lsp.util.make_range_params(0, "utf-8")
	local clients = vim.lsp.get_clients({ bufnr })
	for _, client in ipairs(clients) do
		if client.name == "ts_ls" then
			params.context = { only = { "source.removeUnused.ts" } }
			require("lsp.commands.utils").executeBufferCodeAction(client, params)
		end
	end
end, { range = true })
