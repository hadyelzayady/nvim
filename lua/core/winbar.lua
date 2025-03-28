vim.o.winbar = "%f %r %m%{%v:lua.Winbar()%}"

function Winbar()
  local ts_context = require("nvim-treesitter").statusline()
  if ts_context then
      return "| " .. ts_context
  end
  return ""
end
