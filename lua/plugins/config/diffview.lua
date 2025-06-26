local M = {}

M.opts = {
	hooks = {
		diff_buf_read = function()
			vim.opt_local.wrap = false
			vim.opt_local.list = false
		end,
	},
}

M.cmd = {
	"DiffviewClose",
	"DiffviewFileHistory",
	"DiffviewFocusFiles",
	"DiffviewLog",
	"DiffviewOpen",
	"DiffviewRefresh",
	"DiffviewToggleFiles",
}

return M
