local M = {}

function M.setup()
  require 'lspconfig'.cssmodules_ls.setup {
    capabilities = require("plugins-new.lsp.servers_configs").capabilities,
    init_options = {
      camelCase = true,
    },
  }
end

return M
