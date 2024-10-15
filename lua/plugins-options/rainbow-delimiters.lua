local M = {}

function M.config()
	require("rainbow-delimiters.setup").setup({
		strategy = {},
		query = {},
		highlight = {},
	})
end

return M
