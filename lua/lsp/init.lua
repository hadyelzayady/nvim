require("lsp.diagnostics").setup()
require("lsp.servers").setup()
require("lsp.commands")

vim.lsp.enable("lua_ls")
vim.lsp.enable("ts_ls")
vim.lsp.enable("biome")
vim.lsp.enable("jdtls")
