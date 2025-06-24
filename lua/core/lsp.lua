local M = {}

M.capabilities = vim.tbl_deep_extend("force", vim.lsp.protocol.make_client_capabilities(), {
	textDocument = { completion = { completionItem = { snippetSupport = true } } },
	require("lsp-file-operations").default_capabilities(),
})

function M.setup()
	-- require("java").setup({
	-- 	jdk = {
	-- 		auto_install = false,
	-- 	},
	-- })
	vim.lsp.config("*", {
		capabilities = M.capabilities,
	})
	vim.lsp.config("sqls", {
		root_markers = { ".git" },
	})
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
	vim.lsp.enable("sqls")
end

return M
