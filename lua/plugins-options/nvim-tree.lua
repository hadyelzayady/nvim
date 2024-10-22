local M = {}

local VIEW_WIDTH_FIXED = 30
local view_width_max = VIEW_WIDTH_FIXED -- fixed to start

local function get_view_width_max()
	return view_width_max
end
function M.toggle_width_adaptive()
	if view_width_max == -1 then
		view_width_max = VIEW_WIDTH_FIXED
	else
		view_width_max = -1
	end

	require("nvim-tree.api").tree.reload()
end

local function label()
	return vim.fs.basename(vim.loop.cwd() or "")
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
		modified = {
			enable = true,
		},
		renderer = {
			root_folder_label = label,
			group_empty = true,

			icons = {
				git_placement = "after",
				modified_placement = "before",
				glyphs = {
					modified = icons.file.modified,
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
		view = {
			width = {
				min = 30,
				max = get_view_width_max,
			},
		},
	})
end

return M
