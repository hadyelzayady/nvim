local ok, mod = pcall(require, "goto-preview")
if ok and mod.setup then
	mod.setup({
		default_mappings = true, -- Bind default mappings
		references = {
			provider = "fzf_lua", -- telescope|fzf_lua|snacks|mini_pick|default
		},
	})
end
