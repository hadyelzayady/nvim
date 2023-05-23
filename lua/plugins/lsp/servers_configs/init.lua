local M = {}

function M.setup()
  require('plugins.lsp.servers_configs.rust').setup()
  require('plugins.lsp.servers_configs.tsserver').setup()
  require('plugins.lsp.servers_configs.json').setup()
  require('plugins.lsp.servers_configs.yaml').setup()
  require('plugins.lsp.servers_configs.lua').setup()
  require('plugins.lsp.servers_configs.eslint').setup()
  require('plugins.lsp.servers_configs.cssmodules').setup()
  require('plugins.lsp.servers_configs.csslsp').setup()
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

-- nvim-cmp
M.capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

M.capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

return M
