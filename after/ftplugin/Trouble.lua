local map = require("utils.functions").map

map("n", "<leader>t", function()
	vim.cmd("TroubleClose")
	vim.cmd("copen")
end, { desc = "Quickfix" })
