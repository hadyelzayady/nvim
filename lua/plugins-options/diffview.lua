local M = {}

function M.config()
	require("diffview").setup()
end

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
