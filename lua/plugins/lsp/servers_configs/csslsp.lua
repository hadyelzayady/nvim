local M = {}

function M.setup()
  require 'lspconfig'.cssls.setup {
    capabilities = vim.deepcopy(require("plugins.lsp.servers_configs").capabilities),
  }
end

return M
