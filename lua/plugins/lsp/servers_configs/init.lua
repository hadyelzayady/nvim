local M = {}

function M.setup()
  -- Add bun for Node.js-based servers
  -- local lspconfig_util = require "lspconfig.util"
  -- local add_bun_prefix = require("plugins.lsp.servers_configs.bun").add_bun_prefix
  -- lspconfig_util.on_setup = lspconfig_util.add_hook_before(lspconfig_util.on_setup, add_bun_prefix)
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
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

-- nvim-cmp
M.capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)


return M
