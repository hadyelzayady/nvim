local M = {}

function M.config()
	require("action-hints").setup({
		template = {
			-- definition = { text = " ⊛", color = "#add8e6" },
			definition = { text = "", color = "#add8e6" },
			references = { text = " ↱%s", color = "#ff6666" },
		},
		use_virtual_text = true,
	})
end

return M
