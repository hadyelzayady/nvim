local M = {}

function M.config()
	require("oil").setup({
		delete_to_trash = true,
		default_file_explorer = false,
		keymaps = {
			["q"] = "actions.close",
		},
	})
end

return M
