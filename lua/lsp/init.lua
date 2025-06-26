require("lsp.diagnostics").setup()

vim.lsp.config(
	"*",
	require("coq").lsp_ensure_capabilities({
		capabilities = require("lsp.capabilities"),
	})
)

vim.lsp.enable("lua_ls")
vim.lsp.enable("ts_ls")
