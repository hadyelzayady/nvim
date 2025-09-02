local map = vim.keymap.set
map("n", "<C-l>", function()
	require("scribble").toggle()
end, { desc = "Toggle Scribble" })
