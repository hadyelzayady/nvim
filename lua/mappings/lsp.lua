local map = vim.keymap.set

map({ "n", "v" }, "<leader>lf", function()
	require("conform").format({ async = true, lsp_fallback = true })
end, { silent = true, desc = "Format" })
