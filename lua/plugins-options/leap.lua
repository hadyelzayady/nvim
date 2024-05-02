local M = {}

function M.config()
	vim.keymap.set({ "n", "x", "o" }, ",", "<Plug>(leap-forward)")
	vim.keymap.set({ "n", "x", "o" }, "g,", "<Plug>(leap-backward)")
	-- vim.keymap.set({ "n", "x", "o" }, "gs", "<Plug>(leap-from-window)")
end

return M
