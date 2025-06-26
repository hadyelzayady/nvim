local map = vim.keymap.set

-- fzf-lua
map("n", "<leader>ff", "<cmd>FzfLua files resume=true<CR>", { desc = "Find Files" })
map("n", "<C-e>", "<cmd>FzfLua oldfiles<cr>", { desc = "Recent Files" })


