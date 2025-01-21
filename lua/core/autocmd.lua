local function augroup(name)
	return vim.api.nvim_create_augroup("hady_" .. name, { clear = true })
end

local autocmd = vim.api.nvim_create_autocmd
-- Highlight on yank
autocmd("TextYankPost", {
	group = augroup("hilight_on_yank"),
	callback = function()
		vim.hl.on_yank({ timeout = 40 })
	end,
})

autocmd("BufReadPost", {
	group = augroup("last_loc"),
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

local function prefix_last_commit_message()
	local cmd = "git log -1 --pretty=%B"
	local commit_message = vim.fn.system(cmd)

	if vim.v.shell_error == 0 then
		local trimmed_message = commit_message:gsub("%s+$", "")
		local keys = trimmed_message:gsub("\n", "\r")
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(keys, true, false, true), "n", false)
	else
		print("Error: Unable to fetch last commit message. Are you in a Git repository?")
	end
end

vim.api.nvim_create_autocmd("FileType", {
	pattern = "gitcommit",
	callback = prefix_last_commit_message,
})
