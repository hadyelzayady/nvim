local map = vim.keymap.set

map({ "n", "v" }, "<leader>lf", function()
	require("conform").format({ async = true, lsp_fallback = true })
end, { silent = true, desc = "Format" })

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })

map("n", "[w", function() vim.diagnostic.jump({ count = -vim.v.count1, severity = "WARN" }) end, { silent = true, desc = "Prev Warning" })
-- stylua: ignore
map("n", "]w", function() vim.diagnostic.jump({ count = vim.v.count1, severity = "WARN" }) end, { silent = true, desc = "Next Warning" })
-- stylua: ignore
map("n", "[e", function() vim.diagnostic.jump({ count = -vim.v.count1, severity = "ERROR" }) end, { silent = true, desc = "Prev Error" })
-- stylua: ignore
map("n", "]e", function() vim.diagnostic.jump({ count = vim.v.count1, severity = "ERROR" }) end, { silent = true, desc = "Next Error" })
