local map = vim.keymap.set

map("n", "<leader>sw", "<cmd>FzfLua grep_cword<cr>", { desc = "Search Current Word (project)" })
map("n", "<leader>sb", function()
	require("fzf-lua").grep_curbuf({ previewer = "builtin", winopts = { preview = { hidden = false } } })
end, { desc = "Search Buffer" })
map("n", "<leader>sp", "<cmd>FzfLua grep_project<cr>", { desc = "Search Project" })
map({ "n", "v" }, "<leader>sv", "<cmd>FzfLua grep_visual<cr>", { desc = "Search Visual", noremap = true })
map("n", "<leader>sg", "<cmd>FzfLua live_grep_glob<cr>", { desc = "Grep" })
