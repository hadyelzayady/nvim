local function label()
	return vim.fs.basename(vim.loop.cwd() or "")
end
local function on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	-- default mappings
	api.map.on_attach.default(bufnr)
	vim.keymap.set("n", "<leader>ff", function()
		local node = api.tree.get_node_under_cursor()
		require("fff").find_files_in_dir(node.absolute_path)
	end, opts("Find In Dir"))
	vim.keymap.set("n", "<leader>fs", function()
		local node = api.tree.get_node_under_cursor()
		require("fff").live_grep({cwd=node.absolute_path})
	end, opts("Grep In Dir"))
end
return {
	disable_netrw = true,
	hijack_cursor = true,
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
		enable = true,
	},
	renderer = {
		root_folder_label = label,
		group_empty = false,
		icons = {
			git_placement = "after",
			modified_placement = "before",
			glyphs = {
				folder = {
					symlink = "",
					symlink_open = "",
				},
			},
		},
	},
	modified = {
		enable = true,
	},
	view = {
		adaptive_size = true,
	},
	on_attach = on_attach,
}
