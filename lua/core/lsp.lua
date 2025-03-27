local M = {}

M.capabilities = vim.tbl_deep_extend("force", vim.lsp.protocol.make_client_capabilities(), {
	textDocument = { completion = { completionItem = { snippetSupport = true } } },
})

function M.setup()
	vim.lsp.config("*", {
		capabilities = M.capabilities,
	})
	-- you can find server configurations from lsp/*.lua files
	vim.lsp.enable("lua_ls")
	vim.lsp.enable("vtsls")
	vim.lsp.enable("eslint")
	vim.lsp.enable("json")
	vim.lsp.enable("yaml")
	vim.lsp.enable("compose")
	vim.lsp.enable("dockerls")
	vim.lsp.enable("cssmodules")
	-- vim.lsp.enable("ai")
	-- vim.lsp.enable("ts_ls")
end

return M
