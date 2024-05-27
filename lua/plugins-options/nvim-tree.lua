local M = {}

local function label(path)
	return vim.fs.basename(vim.loop.cwd() or "")
end
function M.config()
	require("nvim-tree").setup({
		filters = { custom = { "^.git$" } },
		filesystem_watchers = {
			ignore_dirs = {
				"node_modules",
			},
		},
		renderer = { root_folder_label = label, group_empty = label },
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
