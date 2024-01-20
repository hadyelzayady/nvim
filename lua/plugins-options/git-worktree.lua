local M = {}

function M.config()
	require("git-worktree").setup()
	require("telescope").load_extension("git_worktree")
end

return M
