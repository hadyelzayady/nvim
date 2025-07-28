local map = vim.keymap.set

map("n", "<leader>e", "<cmd>CHADopen<CR>", { desc = "File Tree" })
map("n", "-", "<cmd>Oil<CR>", { desc = "Oil" })

map("n", "<leader>d", function()
	MiniBufremove.delete(0)
end, { desc = "Delete Buffer" })
-- stylua: ignore
map("n", "<leader>D", function() MiniBufremove.delete(0, true) end, { desc = "Force Delete Buffer" })

map("n", "<leader>cS", "<cmd>AerialToggle<cr>", { silent = true, desc = "Symbole Outline" })
map("n", "<leader>cs", "<cmd>AerialNavToggle<cr>", { silent = true, desc = "Symbole Nav" })

--================= Fuzzy =========================
map("n", "<leader>ff", "<cmd>FzfLuaFiles<CR>", { desc = "Find Files" })
map("n", "<leader>fq", "<cmd>FzfLua quickfix<CR>", { desc = "Fzf Quickfix" })

map("n", "<C-e>", "<cmd>FzfLua oldfiles<cr>", { desc = "Recent Files" })
map("n", "<leader>'", "<cmd>FzfLua resume<CR>", { desc = "Fzf Resume" })
map("n", "<leader>w", "<cmd>DBUIToggle<CR>", { desc = "Toggle DBUI" })
