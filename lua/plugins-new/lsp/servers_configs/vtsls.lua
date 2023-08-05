
local M = {}

function M.setup()
  require("lspconfig").vtsls.setup({
    inlay_hints = { enabled = true },
      -- cmd = { 'bunx', '--bun', 'typescript-language-server', '--stdio' },
    settings = {
      typescript = {
        inlayHints = {
          includeInlayParameterNameHints = 'all',
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayVariableTypeHintsWhenTypeMatchesName = false,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        }
      },
      javascript = {
        inlayHints = {
          includeInlayParameterNameHints = 'all',
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayVariableTypeHintsWhenTypeMatchesName = false,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        }
      }
    },
    experimental = {
      completion = {
        enableServerSideFuzzyMatch = true
      }
    },
    capabilities = require("plugins-new.lsp.servers_configs").capabilities,
    on_attach = function(client, buffer)
      client.server_capabilities.documentFormattingProvider = nil
      -- client.handlers["textDocument/definition"] = function(x, y)
      -- end
    end,
  })

end

return M
