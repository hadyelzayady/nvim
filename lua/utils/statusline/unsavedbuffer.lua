local has_unsaved = false

-- Update the flag when a buffer is modified or saved
vim.api.nvim_create_autocmd({ "BufModifiedSet", "BufWritePost" }, {
	group = vim.api.nvim_create_augroup("hady_status_unsaved", { clear = true }),
	callback = function()
		for _, buf in ipairs(vim.api.nvim_list_bufs()) do
			if vim.bo[buf].modified then
				has_unsaved = true
				return
			end
		end
		has_unsaved = false
	end,
})

-- Function for statusline
function _G.HasUnsavedBuffers()
	return has_unsaved and "Unsaved" or ""
end
