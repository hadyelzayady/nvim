vim.api.nvim_create_autocmd("LspNotify", {
	callback = function(args)
		if args.data.method == "textDocument/didOpen" then
			vim.lsp.foldclose("imports", vim.fn.bufwinid(args.buf))
		end
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client:supports_method("textDocument/foldingRange") then
			vim.wo.foldmethod = "expr"
			vim.wo.foldlevel=99
			vim.wo.foldexpr = "v:lua.vim.lsp.foldexpr()"
		end
	end,
})
-- you can find server configurations from lsp/*.lua files
vim.lsp.enable({ "lua_ls", "css", 'cssmodules', "biome" })
vim.lsp.enable("vtsls")
vim.lsp.enable("eslint")
-- vim.lsp.enable("ts_ls")
