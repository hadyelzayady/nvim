local M = {}
function M.config()
	require("mini.splitjoin").setup({
		mappings = {
			toggle = "gs",
			split = "gS",
			join = "gJ",
		},
	})
end

return M
