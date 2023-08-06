local M = {}

function M.format()
  local filetype_table = require("formatter.config").values.filetype
  if filetype_table[vim.bo.filetype] then
    return ":Format<cr>"
  else
    vim.lsp.buf.format({async=true})
  end
  -- local sucess = pcall(vim.cmd,"Format")
  -- if not sucess then
  --   vim.lsp.buf.format({async=true})
  -- end
end

return M
