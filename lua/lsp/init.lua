vim.lsp.enable("lua_ls")

vim.lsp.config("*", {
	capabilities = require("lsp.capabilities"),
})

require("lsp.diagnostics")
