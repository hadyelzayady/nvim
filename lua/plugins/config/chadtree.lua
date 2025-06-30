local M = {}

function M.config()
	local chadtree_settings = {
		["keymap.quit"] = {},
		["ignore.path_glob"] = {},
		["ignore.name_exact"] = {
			"node_modules",
			"dist",
			"build",
		},
	}
	vim.api.nvim_set_var("chadtree_settings", chadtree_settings)
end

return M
