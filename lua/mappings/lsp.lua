local map = vim.keymap.set

map({ "n", "v" }, "<leader>lf", function()
	require("conform").format({ async = true, lsp_fallback = true })
end, { silent = true, desc = "Format" })

-- ====================  Code Navigation ================
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to Declaration" })
vim.keymap.set("n", "gru", function()
	vim.lsp.buf.references({ includeDeclaration = false })
end, { desc = "Go to References" })
vim.keymap.set("n", "grr", "<cmd>LspSymbolUsages<cr>", { desc = "Symbol Usages" })
vim.keymap.set("n", "grs", vim.lsp.buf.document_symbol, { desc = "Document Symbols" })
vim.keymap.set("n", "grS",  vim.lsp.buf.workspace_symbol, { desc = "Workspace Symbols" })

-- ===================== Code Actions =======================

vim.keymap.set("n", "<leader>ci", "<cmd>LspAddMissingImports<cr>", { desc = "Add Missing Imports" })
vim.keymap.set("n", "<leader>cc", "<cmd>LspRemoveUnused<cr>", { desc = "Remove Unused" })
vim.keymap.set("n", "<leader>cC", "<cmd>LspRemoveUnusedImports<cr>", { desc = "Remove Unused Imports" })
vim.keymap.set("n", "<leader>cf", "<cmd>LspFixAll<cr>", { desc = "Fix All" })

-- =================== Diagnostic Navigation===================
map("n", "[w", function()
	vim.diagnostic.jump({ count = -vim.v.count1, severity = "WARN" })
end, { silent = true, desc = "Prev Warning" })

map("n", "]w", function()
	vim.diagnostic.jump({ count = vim.v.count1, severity = "WARN" })
end, { silent = true, desc = "Next Warning" })

map("n", "[e", function()
	vim.diagnostic.jump({ count = -vim.v.count1, severity = "ERROR" })
end, { silent = true, desc = "Prev Error" })

map("n", "]e", function()
	vim.diagnostic.jump({ count = vim.v.count1, severity = "ERROR" })
end, { silent = true, desc = "Next Error" })
