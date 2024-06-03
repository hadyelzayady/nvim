local M = {}

function M.config()
	require("possession").setup({
		autosave = {
			current = false, -- or fun(name): boolean
			tmp = true, -- or fun(): boolean
			tmp_name = function()
				return vim.fs.basename(vim.loop.cwd() or "")
			end, -- or fun(): string
			on_load = true,
			on_quit = true,
		},
		commands = {
			save = "SSave",
			load = "SLoad",
			delete = "SDelete",
			list = "SList",
		},
	})
end

return M
