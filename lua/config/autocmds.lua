local function augroup(name)
	return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup("hilight_on_yank"),
	callback = function()
		vim.highlight.on_yank({ timeout = 40 })
	end,
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
	group = augroup("last_loc"),
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

vim.api.nvim_create_autocmd("BufRead", {
	group = augroup("CmpSourceCargo"),
	pattern = "Cargo.toml",
	callback = function()
		require("cmp").setup.buffer({ sources = { { name = "crates" } } })
	end,
})


vim.api.nvim_create_autocmd("BufWritePost", {
	group = augroup("sxhkd"),
	pattern = "sxhkdrc",
	callback = function()
  vim.cmd("!pkill sxhkd && sxhkd &")
	end,
})

-- vim.api.nvim_create_autocmd("BufWritePost", {
-- 	group = vim.api.nvim_create_augroup("polybar", { clear = true }),
-- 	pattern = "polybar/config.ini",
-- 	callback = function()
--   vim.cmd("!pkill polybar && polybar &")
-- 	end,
-- })
-- if you only want these mappings for toggle term use term://*toggleterm#* instead
--vim.cmd('autocmd! TermOpen term://*toggleterm#* lua require("config.keymaps").terminal_keymaps()')
