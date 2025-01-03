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
