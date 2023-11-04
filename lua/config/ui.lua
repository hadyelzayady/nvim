-- If you want icons for diagnostic errors, you'll need to define them somewhere:
local diagnostics_icons = require("utils.ui-components").icons.diagnostics
vim.fn.sign_define("DiagnosticSignError", { text = diagnostics_icons.Error, texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = diagnostics_icons.Warn, texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = diagnostics_icons.Info, texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = diagnostics_icons.Hint, texthl = "DiagnosticSignHint" })
