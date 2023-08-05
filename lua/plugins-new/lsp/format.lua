local M = {}

function M.format()
  local sucess = pcall(vim.cmd,"Format")
  if not sucess then
    vim.lsp.buf.format({async=true})
  end
end

return M
