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

-- vim.api.nvim_create_autocmd("InsertEnter", {
-- 	group = vim.api.nvim_create_augroup("CmpSourceNpm", { clear = true }),
-- 	pattern = "package.json",
-- 	callback = function()
-- 		require("cmp").setup.buffer({ sources = { { name = "npm" } } })
-- 	end,
-- })
