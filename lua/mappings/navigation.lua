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
