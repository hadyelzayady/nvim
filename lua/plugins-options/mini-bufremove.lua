local M = {}

function M.config()
	require("mini.bufremove").setup()
	require("config.keymaps").bufremove()
end

return M
