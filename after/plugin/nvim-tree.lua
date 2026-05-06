local function label()
	return vim.fs.basename(vim.loop.cwd() or "")
end

local adaptive_size = true
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
	filters = {
		exclude = {
			".env.development.local",
		},
	},
	git = {
		enable = false,
	},
	renderer = {
		root_folder_label = label,
		group_empty = false,

		icons = {
			git_placement = "after",
			modified_placement = "before",
			glyphs = {
				folder = {
					-- default = icons.folder.closed,
					-- open = icons.folder.opened,
					-- empty_open = icons.folder.empty,
					symlink = "",
					symlink_open = "",
				},
				-- git = {
				-- unstaged = icons.git.unstaged,
				-- staged = icons.git.staged,
				-- unmerged = icons.git.conflict,
				-- renamed = icons.git.renamed,
				-- untracked = icons.git.untracked,
				-- deleted = icons.git.removed,
				-- ignored = icons.git.ignored,
				-- },
			},
		},
	},
	modified = {
		enable = true,
	},
	view = {
		adaptive_size = adaptive_size,
		-- width = {
		-- 	min = 30,
		-- 	max = function()
		-- 		return view_width_max
		-- 	end,
		-- },
		-- width = {
		-- 	min = 30,
		-- 	max = get_view_width_max,
		-- },
	},
})
