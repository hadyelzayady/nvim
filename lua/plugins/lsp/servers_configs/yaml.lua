local M = {}

function M.setup()
  local lspconfig = require('lspconfig')
  local capabilities = vim.deepcopy(require("plugins.lsp.servers_configs").capabilities)
  capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = false,
  }

  lspconfig.yamlls.setup {
    -- Server-specific settings. See `:help lspconfig-setup`
    capabilities = capabilities,
    settings = {
      yaml = {
        hover = true,
        completion = true,
        validate = true,
        schemaStore = {
          enable = true,
          url = "https://www.schemastore.org/api/json/catalog.json",
        },
        -- schemas = require("schemastore").yaml.schemas(),
        schemas = vim.list_extend(
          {
            {
              description = 'openapi',
              fileMatch = { 'openapi-merged.yaml' },
              name = 'openapi-merged.yaml',
              url = 'https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.0/schema.yaml',
            },
          },
          require('schemastore').yaml.schemas()
        ),
      },
    },
  }
end

return M
