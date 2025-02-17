vim.api.nvim_create_user_command("DiffBuf", function(args)
	if vim.opt.diff._value == false then
		vim.cmd("windo diffthis")
	else
		vim.cmd("windo diffoff")
	end
end, { range = true })

local previous_layout = nil
-- Function to open LazyGit in a new Kitty window and maximize it
function OpenLazyGitInKittyMaximizedWindow()
	vim.system({ "kitty", "@", "ls" }, { text = true }, function(output)
		vim.system({ "kitty", "@", "launch", "--type=overlay", "--cwd=current", "lazygit" })
	end)
end

function ReturnToPreviousKittyLayout()
	if previous_layout then
		vim.system({ "kitty", "@", "goto-layout", previous_layout })
		previous_layout = nil -- Clear after use
	else
		print("No previous layout saved.")
	end
end

-- Function to open LazyGit in a new Kitty window and maximize it
function OpenGitUIInKittyMaximizedWindow()
	vim.system({ "kitty", "@", "launch", "--type=overlay", "--cwd=current", "gitui" })
end

vim.api.nvim_create_user_command("Lazygit", OpenLazyGitInKittyMaximizedWindow, {})
vim.api.nvim_create_user_command("Gitui", OpenGitUIInKittyMaximizedWindow, {})
-- vim.api.nvim_create_user_command("nadd", OpenGitUIInKittyMaximizedWindow, {})
