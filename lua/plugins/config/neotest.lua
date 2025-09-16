local M = {}
function M.config()
	require("neotest").setup({
		adapters = {
			require("neotest-bun"),
		},
	})
end
return M
