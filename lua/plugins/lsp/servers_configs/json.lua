local M = {}

function M.setup()
  local lspconfig = require('lspconfig')
  lspconfig.jsonls.setup {
    -- Server-specific settings. See `:help lspconfig-setup`
    capabilities = vim.deepcopy(require("plugins.lsp.servers_configs").capabilities),
    settings = {
      json = {
        schemas = vim.list_extend(
          {
            {
              -- custom schema
              -- description = 'My Custom JSON schema',
              -- fileMatch = { 'foobar.json', '.foobar.json' },
              -- name = 'foobar.json',
              -- url = 'https://example.com/schema/foobar.json',
            },
          },
          require('schemastore').json.schemas()
        ),
        validate = { enable = true },
      },
    },
  }
end

return M
