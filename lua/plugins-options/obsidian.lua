local M = {}
M.opts = {
    -- as I use render-markdown plugin
    ui = { enable = false },
	workspaces = {
		{
			name = "personal",
			path = "~/vaults/personal",
		},
	},
	picker = {
		name = "fzf-lua",
	},
	completion = {
		nvim_cmp = false, -- disable!
	},
}
return M
