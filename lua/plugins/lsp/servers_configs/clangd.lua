local M = {}

function M.setup()
  require 'lspconfig'.clangd.setup {
    capabilities = vim.deepcopy(require("plugins.lsp.servers_configs").capabilities),
  }
end

return M
