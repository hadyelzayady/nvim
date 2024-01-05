local M = {}

function M.config(_, opts)
	local crates = require("crates")
	crates.setup(opts)
	require("cmp").setup.buffer({
		sources = { { name = "crates" } },
	})
	crates.show()
end

return M
