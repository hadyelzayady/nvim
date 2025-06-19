local M = {}

M.capabilities = vim.tbl_deep_extend("force", vim.lsp.protocol.make_client_capabilities(), {
	textDocument = { completion = { completionItem = { snippetSupport = true } } },
	require("lsp-file-operations").default_capabilities(),
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
	vim.lsp.enable("biome")
	vim.lsp.enable("gopls")
	vim.lsp.enable("protols")
end

vim.diagnostic.config({
	virtual_text = diagnostic.virtual_text,
	severity_sort = true,
	float = diagnostic.float,
	-- Disable signs in the gutter.
	signs = false,
	virtual_lines = false,
	update_in_insert = false,
})
return M
