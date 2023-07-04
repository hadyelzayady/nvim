local M = {}
local function filter(arr, fn)
  if type(arr) ~= "table" then
    return arr
  end

  local filtered = {}
  for k, v in pairs(arr) do
    if fn(v, k, arr) then
      table.insert(filtered, v)
    end
  end

  return filtered
end

local function filterReactDTS(value)
  -- Depending on typescript version either uri or targetUri is returned
  if value.uri then
    return string.match(value.uri, "%.d.ts") == nil
  elseif value.targetUri then
    return string.match(value.targetUri, "%.d.ts") == nil
  end
end

local handlers = {
  -- ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = EcoVim.ui.float.border }),
  -- ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = EcoVim.ui.float.border }),
  -- ["textDocument/publishDiagnostics"] = vim.lsp.with(
  --   vim.lsp.diagnostic.on_publish_diagnostics,
  --   { virtual_text = EcoVim.lsp.virtual_text }
  -- ),
  ["textDocument/definition"] = function(err, result, method, ...)
    if vim.tbl_islist(result) and #result > 1 then
      local filtered_result = filter(result, filterReactDTS)
      return vim.lsp.handlers["textDocument/definition"](err, filtered_result, method, ...)
    end

    vim.lsp.handlers["textDocument/definition"](err, result, method, ...)
  end,
}

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
      inlay_hints = { enabled = true },

      -- cmd = { 'bunx', '--bun', 'typescript-language-server', '--stdio' },
      handlers = handlers,
      capabilities = require("plugins.lsp.servers_configs").capabilities,
      settings = {
        typescript = {
          inlayHints = {
            includeInlayParameterNameHints = "all",
            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = false,
            includeInlayEnumMemberValueHints = true,
          },
          suggest = {
            includeCompletionsForModuleExports = true,
          },
        },
        javascript = {
          inlayHints = {
            includeInlayParameterNameHints = "all",
            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = false,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = false,
            includeInlayEnumMemberValueHints = true,
          },
          suggest = {
            includeCompletionsForModuleExports = true,
          },
        },
      }
    },
  })
end

return M
