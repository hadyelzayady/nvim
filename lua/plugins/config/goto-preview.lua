local M = {}
M.opts = {
	default_mappings = true, -- Bind default mappings
	references = {
		provider = "fzf_lua", -- telescope|fzf_lua|snacks|mini_pick|default
	},
}
return M
