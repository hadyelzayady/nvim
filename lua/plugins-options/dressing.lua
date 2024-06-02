local M = {}
function M.config()
	require("dressing").setup({
		select = {
			backend = { "fzf_lua", "fzf", "builtin", "nui" },
		},
	})
end
return M
