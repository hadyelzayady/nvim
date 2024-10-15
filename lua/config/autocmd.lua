local function augroup(name)
	return vim.api.nvim_create_augroup("hady_" .. name, { clear = true })
end

local autocmd = vim.api.nvim_create_autocmd
-- Highlight on yank
autocmd("TextYankPost", {
	group = augroup("hilight_on_yank"),
	callback = function()
		vim.highlight.on_yank({ timeout = 40 })
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

-- Function to disable diagnostics in diff mode
local function diff_mode_changes()
	if vim.wo.diff then
		vim.cmd("highlight Folded guibg=clear")
		-- vim.diagnostic.enable(false)
	else
		-- vim.diagnostic.enable(true)
		vim.cmd("highlight Folded guibg=#3b4261")
	end
end

-- -- Autocmd to disable diagnostics when entering a buffer in diff mode
-- autocmd({ "BufEnter", "BufWinEnter" }, {
-- 	group = augroup("diff_diagnostics"),
-- 	callback = function()
-- 		diff_mode_changes()
-- 	end,
-- })

-- Autocmd to recheck diagnostics when the diff mode state changes
autocmd("OptionSet", {
	group = augroup("diff_diagnostics"),
	pattern = "diff",
	callback = function()
		diff_mode_changes()
	end,
})

-- Set autocommand to update undofile path
autocmd("BufWritePost", {
	group = augroup("undo"),
	pattern = "*",
	callback = require("utils.undo").write_undo,
})

autocmd("BufReadPost", {
	group = augroup("undo"),
	pattern = "*",
	callback = require("utils.undo").read_undo,
})


-- autocmd("BufReadPre", {
-- 	group = augroup("rainbow"),
-- 	pattern = "*",
-- 	callback = require("utils.undo").read_undo,
-- })
