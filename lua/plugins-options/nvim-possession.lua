local M = {}

function M.config()
	require("nvim-possession").setup({
		autoload = true, -- whether to autoload sessions in the cwd at startup
		autosave = true, -- whether to autosave loaded sessions before quitting
		autoswitch = {
			enable = true, -- whether to enable autoswitch
		},
	})
end

return M
