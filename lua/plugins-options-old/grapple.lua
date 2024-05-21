local M = {}

function M.config()
	require("grapple").setup()
	require("config.keymaps").grapple()
	require("telescope").load_extension("grapple")
end

return M
