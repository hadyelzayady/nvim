-- Show dependency versions
vim.keymap.set({ "n" }, "<LEADER>ps", function()
	require("package-info").show()
end, { desc = "Show", silent = true, noremap = true })

-- Hide dependency versions
vim.keymap.set({ "n" }, "<LEADER>ph", function()
	require("package-info").hide()
end, { desc = "Hide", silent = true, noremap = true })

-- Toggle dependency versions
vim.keymap.set({ "n" }, "<LEADER>pt", function()
	require("package-info").toggle()
end, { desc = "Toggle", silent = true, noremap = true })

-- Update dependency on the line
vim.keymap.set({ "n" }, "<LEADER>pu", function()
	require("package-info").update()
end, { desc = "Update", silent = true, noremap = true })

-- Delete dependency on the line
vim.keymap.set({ "n" }, "<LEADER>pd", function()
	require("package-info").delete()
end, { desc = "Delete", silent = true, noremap = true })

-- Install a new dependency
vim.keymap.set({ "n" }, "<LEADER>pi", function()
	require("package-info").install()
end, { desc = "Install", silent = true, noremap = true })

-- Install a different dependency version
vim.keymap.set({ "n" }, "<LEADER>pp", function()
	require("package-info").change_version()
end, { desc = "Change Version", silent = true, noremap = true })
