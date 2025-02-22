local M = {}
function M.root_dir(root_markers)
	return function(cb)
		local root_dir = vim.fs.find(root_markers, {
			upward = true,
			stop = vim.uv.os_homedir(), -- Prevents searching beyond the home directory
		})[1]

		if not root_dir or root_dir:match("node_modules") then
			return nil
		end -- Ignore node_modules
		return cb(vim.fs.dirname(root_dir))
	end
end
return M
