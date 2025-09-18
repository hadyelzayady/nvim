vim.opt_local.spell = false
vim.opt_local.cursorline = true -- Highlight current line
vim.opt_local.cursorlineopt = "line"

vim.keymap.set("n", "zz", "<cmd>FzfLua quickfix<cr>", { desc = "Open In Fzf", buffer = true })
