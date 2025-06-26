local map = vim.keymap.set

map("n", "<leader>gg", "<cmd>Lazygit<CR>", { desc = "Lazygit", silent = true })
map("n", "<leader>gG", "<cmd>Git<CR>", { desc = "Git", silent = true })
