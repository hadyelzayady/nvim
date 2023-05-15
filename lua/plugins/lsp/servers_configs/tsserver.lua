local M = {}

function M.setup()
  -- require("lspconfig.configs").vtsls = require("vtsls").lspconfig -- set default server config
  -- require("lspconfig").vtsls.setup({
  --   -- cmd = { 'bunx', '--bun', 'typescript-language-server', '--stdio' },
  --   experimental = {
  --     completion = {
  --       enableServerSideFuzzyMatch = true
  --     }
  --   },
  --   capabilities = require("plugins.lsp.servers_configs").capabilities,
  --   on_attach = function(client, buffer)
  --     client.handlers["textDocument/definition"] = function(x, y)
  --     end
  --   end,
  -- })
  require("typescript").setup({
    capabilities = require("plugins.lsp.servers_configs").capabilities,
    disable_commands = false, -- prevent the plugin from creating Vim commands
    debug = false,            -- enable debug logging for commands
    go_to_source_definition = {
      fallback = true,        -- fall back to standard LSP definition on failure
    },
    server = {
      -- cmd = { 'bunx', '--bun', 'typescript-language-server', '--stdio' },
      capabilities = require("plugins.lsp.servers_configs").capabilities,
      on_attach = function(client, buffer)
        client.handlers["textDocument/definition"] = function(x, y)
        end
      end,
    },
  })
end

return M
