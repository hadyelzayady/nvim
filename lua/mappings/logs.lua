local map = vim.keymap.set

map("n", "<leader>,v", ":lua require('chainsaw').variableLog()<cr>", { silent = true, desc = "Variable" })
map("n", "<leader>,l", ":lua require('chainsaw').messageLog()<cr>", { silent = true, desc = "Message" })
map("n", "<leader>,o", ":lua require('chainsaw').objectLog()<cr>", { silent = true, desc = "Object" })
map("n", "<leader>,t", ":lua require('chainsaw').timeLog()<cr>", { silent = true, desc = "Time" })
map("n", "<leader>,x", ":lua require('chainsaw').removeLogs()<cr>", { silent = true, desc = "Clear" })
