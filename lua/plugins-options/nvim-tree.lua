local M = {}

local function label()
	return vim.fs.basename(vim.loop.cwd() or "")
end
local VIEW_WIDTH_FIXED = 30
local view_width_max = VIEW_WIDTH_FIXED -- fixed to start
-- get current view width
local function get_view_width_max()
	return view_width_max
end
-- toggle the width and redraw
function M.toggle_width_adaptive()
	if view_width_max == -1 then
		view_width_max = VIEW_WIDTH_FIXED
	else
		view_width_max = -1
	end

	require("nvim-tree.api").tree.reload()
end

function M.config()
	require("nvim-tree").setup({
		disable_netrw = true,
		hijack_cursor = true, -- Keeps the cursor on the first letter of the filename when moving in the tree.
		filesystem_watchers = {
			ignore_dirs = {
				"node_modules",
				"build",
				"dist",
			},
		},
		renderer = {
			root_folder_label = label,
			group_empty = true,
		},
		view = {
			width = {
				min = 30,
				max = get_view_width_max,
			},
		},
	})
end
return M
