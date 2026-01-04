vim.api.nvim_create_user_command("LspFileReferences", function(args)
	local bufnr = vim.api.nvim_get_current_buf()
	local params = vim.lsp.util.make_range_params(0, "utf-8")
	local clients = vim.lsp.get_clients({ bufnr })
	for _, client in ipairs(clients) do
		if client.name == "vtsls" then
			require("vtsls").commands.file_references()
			return
		end
		if client.name == "ts_ls" then
			client:exec_cmd("typescript.findAllFileReferences", { bufnr = bufnr })
			return
		end
		if client.name == "typescript-tools" then
			vim.cmd("TSToolsFileReferences")
			return
		end
	end
end, { range = true })
