local M = {}

function M.setup()
  require("typescript").setup({
    disable_commands = false, -- prevent the plugin from creating Vim commands
    debug = false,            -- enable debug logging for commands
    go_to_source_definition = {
      fallback = true,        -- fall back to standard LSP definition on failure
    },
    server = {
    on_attach = function(client, buffer)
    client.handlers["textDocument/publishDiagnostics"] = function() end
  end,
    },
  })
end

return M
