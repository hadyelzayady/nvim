local M = {}

function M.config()
	require("oil").setup({
		delete_to_trash = true,
		default_file_explorer = true,
	})
end

return M
