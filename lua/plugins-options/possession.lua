local M = {}

function M.config()
	require("possession").setup({
		commands = {
			save = "SSave",
			load = "SLoad",
			delete = "SDelete",
			list = "SList",
		},
	})
end

return M
