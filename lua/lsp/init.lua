require("lsp.diagnostics").setup()
require("lsp.servers").setup()
-- require("lsp.on_attach").setup()

vim.lsp.enable("lua_ls")
vim.lsp.enable("ts_ls")
vim.lsp.enable("biome")
