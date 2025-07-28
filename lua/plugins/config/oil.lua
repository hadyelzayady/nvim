local M = {}
M.opts = {
	delete_to_trash = true,
	default_file_explorer = false,
	keymaps = {
		["q"] = "actions.close",
	},
	git = {
		-- Return true to automatically git add/mv/rm files
		add = function(path)
			return true
		end,
		mv = function(src_path, dest_path)
			return true
		end,
		rm = function(path)
			return true
		end,
	},
}

return M
