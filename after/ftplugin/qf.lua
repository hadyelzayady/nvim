local map = require('utils.functions').map

map("n", "<leader>t", function()
    vim.cmd("cclose")
    vim.cmd("Trouble quickfix")
end,
    { desc = "Trouble Quickfix" })
