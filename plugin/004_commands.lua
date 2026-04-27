vim.api.nvim_create_user_command("CloseFugitive", function()
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		local buf = vim.api.nvim_win_get_buf(win)
		if vim.bo[buf].filetype == "fugitive" then
			vim.api.nvim_win_close(win, false)
		end
	end
end, {})

vim.api.nvim_create_user_command("Lazygit", function()
	vim.system({ "kitty", "@", "ls" }, { text = true }, function()
		vim.system({ "kitty", "@", "launch", "--type=overlay", "--cwd=current", "lazygit" })
	end)
end, {})
