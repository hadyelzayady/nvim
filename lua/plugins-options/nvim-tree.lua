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
	local icons = require("utils.ui-components").icons
	require("nvim-tree").setup({
		filters = { custom = { "^.git$" } },
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

			icons = {

				git_placement = "after",
				modified_placement = "before",
				glyphs = {
					folder = {
						arrow_closed = "",
						arrow_open = "",
						default = icons.folder.closed,
						open = icons.folder.opened,
						empty = "",
						empty_open = icons.folder.empty,
						symlink = "",
						symlink_open = "",
					},
					git = {
						unstaged = icons.git.unstaged,
						staged = icons.git.staged,
						unmerged = icons.git.conflict,
						renamed = icons.git.renamed,
						untracked = icons.git.untracked,
						deleted = icons.git.removed,
						ignored = icons.git.ignored,
					},
				},
			},
		},
		modified = {
			enable = true,
		},
		diagnostics = {
			enable = true,
			show_on_dirs = true,
			icons = {
				hint = icons.diagnostics.Hint,
				info = icons.diagnostics.Info,
				warning = icons.diagnostics.Warn,
				error = icons.diagnostics.Error,
			},
		},
		-- Here is where we enable case-insensitive filtering
		hijack_directories = {
			enable = true,
			auto_open = true,
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
