local M = {}

function M.config()
	require("kanagawa").setup()
	vim.cmd("colorscheme kanagawa")
end

return M
