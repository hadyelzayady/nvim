local M = {}

function M.setup()
  local lspconfig = require('lspconfig')
  lspconfig.rust_analyzer.setup {
      -- Server-specific settings. See `:help lspconfig-setup`
      settings = {
          ['rust-analyzer'] = {},
      },
  }
end

return M
