local M = {}

local function label(path)
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
		filters = { custom = { "^.git$" } },
		filesystem_watchers = {
			ignore_dirs = {
				"node_modules",
			},
		},
		renderer = { root_folder_label = label, group_empty = true },
		-- Here is where we enable case-insensitive filtering
		hijack_directories = {
			enable = true,
			auto_open = true,
		},
		-- Enable case-insensitive filename filtering
		live_filter = {
			prefix = "[FILTER]: ",
			always_show_folders = false,
		},
		view = {
			width = {
				min = 30,
				max = get_view_width_max,
			},
		},
	})
	-- separate statusline
	local nt_api = require("nvim-tree.api")
	nt_api.events.subscribe(nt_api.events.Event.TreeOpen, function()
		local tree_winid = nt_api.tree.winid()

		if tree_winid ~= nil then
			vim.api.nvim_set_option_value("statusline", "%t", { scope = "local", win = tree_winid })
		end
	end)
end

return M
