local M = {}

function M.setup()
  require('plugins.lsp.servers_configs.rust').setup()
  require('plugins.lsp.servers_configs.tsserver').setup()
  require('plugins.lsp.servers_configs.json').setup()
  require('plugins.lsp.servers_configs.yaml').setup()
  require('plugins.lsp.servers_configs.lua').setup()
  require('plugins.lsp.servers_configs.eslint').setup()
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

-- nvim-cmp
M.capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)


return M
