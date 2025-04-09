local M = {}
function M.config()
	require("goto-preview").setup({
		references = { -- Configure the telescope UI for slowing the references cycling window.
			provider = "fzf_lua", -- telescope|fzf_lua|snacks|mini_pick|default
		},
	})
end
return M
