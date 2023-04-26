local M = {}

function M.setup()
  require 'lspconfig'.eslint.setup{
    on_attach = function(client, buffer)
    client.handlers["textDocument/publishDiagnostics"] = function() end
  end,
  }
end

return M
