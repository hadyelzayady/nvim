local M = {}

M.opts = {
	spec = {
		{ "<leader>g", group = "Git" }, -- group
		{ "<leader>a", group = "AI" }, -- group
		{ "<leader>g,", group = "Agitator" }, -- group
		{ "<leader>t", group = "Toggle" }, -- group
		{ "<leader>f", group = "Find" }, -- group
		{ "<leader>s", group = "Search/Replace" }, -- group
		{ "<leader>c", group = "Code" }, -- group
		{ "<leader>l", group = "Lsp" }, -- group
		{ "<leader>o", group = "Open" }, -- group
		{ "<leader>j", group = "Jump" }, -- group
		{ "<leader>q", group = "Quit/Save" }, -- group
		{ "<leader>lt", group = "Toggle" }, -- group
		{ "<leader>td", group = "DiffOpts" }, -- group
		{ "<leader>,", group = "Log" }, -- group
	},
}

return M
