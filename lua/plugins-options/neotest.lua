local M = {}

function M.config(_, opts)
	require("neotest").setup({
		adapters = {
			require("neotest-jest")({}),
		},
	})
	-- require("config.keymaps").neotest()
end

return M
