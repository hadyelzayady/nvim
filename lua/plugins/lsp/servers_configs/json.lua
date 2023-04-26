local M = {}

function M.setup()
  local lspconfig = require('lspconfig')
  lspconfig.jsonls.setup {
      -- Server-specific settings. See `:help lspconfig-setup`
      capabilities = vim.deepcopy(require("plugins.lsp.servers_configs").capabilities),
      settings = {
          json = {
              schemas = require('schemastore').json.schemas {
                  select = {
                      '.eslintrc',
                      'package.json',
                  },
              },
              validate = { enable = true },
          },
      },
  }
end

return M
