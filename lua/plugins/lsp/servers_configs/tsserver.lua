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

function M.ts_tools_setup()
  require("typescript-tools").setup {
    inlay_hints = { enabled = true },

    -- cmd = { 'bunx', '--bun', 'typescript-language-server', '--stdio' },
    handlers = handlers,
    capabilities = require("plugins.lsp.servers_configs").capabilities,

    settings = {
      -- spawn additional tsserver instance to calculate diagnostics on it
      separate_diagnostic_server = true,
      -- "change"|"insert_leave" determine when the client asks the server about diagnostic
      publish_diagnostic_on = "insert_leave",
      -- string|nil -specify a custom path to `tsserver.js` file, if this is nil or file under path
      -- not exists then standard path resolution strategy is applied
      tsserver_path = nil,
      -- specify a list of plugins to load by tsserver, e.g., for support `styled-components`
      -- (see 💅 `styled-components` support section)
      tsserver_plugins = {},
      -- this value is passed to: https://nodejs.org/api/cli.html#--max-old-space-sizesize-in-megabytes
      -- memory limit in megabytes or "auto"(basically no limit)
      tsserver_max_memory = "auto",
      -- described below
      tsserver_format_options = {},
      tsserver_file_preferences = {},
    },
  }
end

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
