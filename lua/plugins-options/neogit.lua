local M = {}

function M.config()
	require("neogit").setup({
		kind = "split",
		integrations = {
			diffview = true,
			fzf_lua = true,
		},
	})
end

return M
