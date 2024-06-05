local map = vim.keymap.set

map("n", "<leader>t", function()
    vim.cmd("cclose")
    vim.cmd("Trouble quickfix")
end,
    { desc = "Trouble Quickfix" ,buffer=true})
