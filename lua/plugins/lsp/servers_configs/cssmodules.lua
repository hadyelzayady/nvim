local M = {}

function M.setup()
  require 'lspconfig'.cssmodules_ls.setup {
    -- capabilities = require("plugins.lsp.servers_configs").capabilities,
    -- optionally
    init_options = {
      camelCase = true,
    },
  }
end

return M
