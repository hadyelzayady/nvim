require("lsp.diagnostics").setup()

vim.lsp.config("*", {
	capabilities = require("lsp.capabilities"),
})


vim.lsp.enable("lua_ls")

