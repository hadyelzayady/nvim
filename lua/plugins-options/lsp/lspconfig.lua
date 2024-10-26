local M = {}

function M.config()
  local lspconfig = require('lspconfig')

  -- Define a function to configure LSP servers
  local function setup_lsp(server, config)
    -- if config.capabilities == nil then
    --   config.capabilities = require("config.lsp").capabilities
    -- end
    lspconfig[server].setup(config)
  end
  -- Set global defaults for all servers
  lspconfig.util.default_config = vim.tbl_extend(
    'force',
    lspconfig.util.default_config,
    {
      capabilities = vim.tbl_deep_extend(
        "force",
        vim.lsp.protocol.make_client_capabilities(),
        -- returns configured operations if setup() was already called
        -- or default operations if not
        require 'lsp-file-operations'.default_capabilities()
      )
    }
  )
  -- Configure individual servers
  require('plugins-options.lsp.servers.vtsls')(setup_lsp)
  require('plugins-options.lsp.servers.biome')(setup_lsp)
  require('plugins-options.lsp.servers.cssmodules')(setup_lsp)
  require('plugins-options.lsp.servers.cssls')(setup_lsp)
  require('plugins-options.lsp.servers.lua')(setup_lsp)
end

return M
