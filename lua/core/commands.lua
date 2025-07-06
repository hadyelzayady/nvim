vim.api.nvim_create_user_command("DiffBuf", function()
	if vim.opt.diff._value == false then
		vim.cmd("windo diffthis")
	else
		vim.cmd("windo diffoff")
	end
end, { range = true })

-- Function to open LazyGit in a new Kitty window and maximize it
function OpenLazyGitInKittyMaximizedWindow()
	vim.system({ "kitty", "@", "ls" }, { text = true }, function()
		vim.system({ "kitty", "@", "launch", "--type=overlay", "--cwd=current", "lazygit" })
	end)
end

-- Function to open LazyGit in a new Kitty window and maximize it
function OpenGitUIInKittyMaximizedWindow()
	vim.system({ "kitty", "@", "launch", "--type=overlay", "--cwd=current", "gitui" })
end

vim.api.nvim_create_user_command("Lazygit", OpenLazyGitInKittyMaximizedWindow, {})
vim.api.nvim_create_user_command("Gitui", OpenGitUIInKittyMaximizedWindow, {})

vim.api.nvim_create_user_command("CloseFugitive", function()
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		local buf = vim.api.nvim_win_get_buf(win)
		if vim.bo[buf].filetype == "fugitive" then
			vim.api.nvim_win_close(win, false)
		end
	end
end, {})

vim.api.nvim_create_user_command("GitAuthors", function()
	---@diagnostic disable-next-line: different-requires
	local fzf = require("fzf-lua")
	local authors = vim.fn.systemlist("git shortlog -sne --all | awk '{$1=\"\"; print substr($0,2)}' | sort -u")
	if vim.v.shell_error ~= 0 then
		vim.notify("Error fetching authors", vim.log.levels.ERROR)
		return
	end

	fzf.fzf_exec(authors, {
		prompt = "Git Authors❯ ",
		previewer = false,
		actions = {
			["default"] = function(selected)
				local author = selected[1]
				-- Get current cursor position
				local row, _col = unpack(vim.api.nvim_win_get_cursor(0))
				local bufnr = vim.api.nvim_get_current_buf()
				-- Insert new line after the current cursor position
				vim.api.nvim_buf_set_lines(bufnr, row, row, false, { "", "Co-authored-by: " .. author })
			end,
		},
	})
end, {})
