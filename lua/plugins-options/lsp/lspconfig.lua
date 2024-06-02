local M = {}

function M.config(_, opts)
	require("plugins-options.lsp.servers-configs").setup()
end

M.capabilities = require("cmp_nvim_lsp").default_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
return M
