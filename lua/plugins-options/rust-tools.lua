local M = {}

function M.config()
	local rt = require("rust-tools")

	rt.setup({
		server = {},
	})
end

return M
