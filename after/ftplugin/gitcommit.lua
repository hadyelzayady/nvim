vim.keymap.set("n", "<leader>c", function()
	require("codecompanion").prompt("commit")
end, { noremap = true, silent = true, buffer = true })

vim.keymap.set("n", "<leader>C", function()
	require("codecompanion").prompt("commitChat")
end, { noremap = true, silent = true, buffer = true })

