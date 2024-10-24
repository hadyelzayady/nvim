for name in pairs(require("utils.ui-components").icons.diagnostics) do
  name = "DiagnosticSign" .. name
  vim.fn.sign_define(name, { text = "", texthl = name, numhl = name })
end
