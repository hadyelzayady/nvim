local map = vim.keymap.set

-- fzf-lua
map("n", "<leader>ff", "<cmd>FzfLuaFiles<CR>", { desc = "Find Files" })
map("n", "<leader>sg", "<cmd>FzfLua live_grep resume=true<CR>", { desc = "Grep Files" })

map("n", "<leader>sb", function()
	require("fzf-lua").grep_curbuf({ previewer = "builtin", winopts = { preview = { hidden = false } } })
end, { desc = "Search Buffer" })


map("n", "<C-e>", "<cmd>FzfLuaFiles<cr>", { desc = "Recent Files" })



