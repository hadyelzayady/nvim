local M = {}

function M.config()
	local original_colorscheme = vim.g.colors_name
	require("diffview").setup({
		hooks = {
			diff_buf_read = function(bufnr)
				-- Change local options in diff buffers
				vim.opt_local.wrap = false
				vim.opt_local.list = false
			end,
			-- view_enter = function(view)
			-- 	original_colorscheme = vim.g.colors_name
			-- 	vim.cmd("colorscheme default")
			-- end,
			-- view_leave = function()
			-- 	-- require("plugins-options.evergarden").config()
			-- end
		}
	})
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
