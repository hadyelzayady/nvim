vim.api.nvim_create_user_command("DiffBuf", function(args)
	if vim.opt.diff._value == false then
		vim.cmd("windo diffthis")
	else
		vim.cmd("windo diffoff")
	end
end, { range = true })

-- Function to open LazyGit in a new Kitty window and maximize it
function OpenLazyGitInKittyMaximizedWindow()
	vim.system({ "kitty", "@", "launch", "--type=window", "--cwd=current", "lazygit" })
	vim.system({ "kitty", "@", "goto-layout", "stack" })
end
-- Function to open LazyGit in a new Kitty window and maximize it
function OpenGitUIInKittyMaximizedWindow()
	vim.system({ "kitty", "@", "launch", "--type=window", "--cwd=current", "gitui" })
	vim.system({ "kitty", "@", "goto-layout", "stack" })
end

vim.api.nvim_create_user_command("Lazygit", OpenLazyGitInKittyMaximizedWindow, {})
vim.api.nvim_create_user_command("Gitui", OpenGitUIInKittyMaximizedWindow, {})
