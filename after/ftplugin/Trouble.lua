vim.keymap.set("n", "<leader>t", function()
	vim.cmd("TroubleClose")
	vim.cmd("copen")
end, { desc = "Quickfix", buffer = true })
