-- Hover UI
-- To instead override globally
-- vim.cmd([[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]])
-- vim.cmd([[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]])

local border = {
  { "🭽", "FloatBorder" },
  { "▔", "FloatBorder" },
  { "🭾", "FloatBorder" },
  { "▕", "FloatBorder" },
  { "🭿", "FloatBorder" },
  { "▁", "FloatBorder" },
  { "🭼", "FloatBorder" },
  { "▏", "FloatBorder" },
}
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- End Hover UI

-- Signs
for name in pairs(require("utils.ui-components").icons.diagnostics) do
  name = "DiagnosticSign" .. name
  vim.fn.sign_define(name, { text = "", texthl = name, numhl = name })
end
