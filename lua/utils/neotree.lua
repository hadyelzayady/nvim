local M = {}

function M.on_file_remove(args)
	require("plugins.lsp.rename_file").rename_file({ old_name = args.source, new_name = args.destination })
end
function M.git_diff_file(state)
	local node = state.tree:get_node()
	local file = node:get_id()
	vim.cmd("DiffviewOpen -- " .. file)
end

function M.git_diff()
	vim.cmd("DiffviewOpen")
end

function M.copy_absolute_path_to_system_clipboard(state)
	local node = state.tree:get_node()
	local path = node:get_id()
	-- macOs: open file in default application in the background.
	-- Probably you need to adapt the Linux recipe for manage path with spaces. I don't have a mac to try.
	os.execute("echo " .. path .. " | pbcopy")
end

function M.paste_from_system_clipboard(state)
	local file_path = require("utils.functions").os_capture("pbpaste")
	local node = state.tree:get_node()
	local parent_path = node:get_parent_id()
	os.execute("cp -rf " .. '"' .. file_path .. '"' .. " " .. node.path)
	vim.cmd("Neotree show")
end

function M.diff_files(state)
	local node = state.tree:get_node()
	local log = require("neo-tree.log")
	state.clipboard = state.clipboard or {}
	if diff_Node and diff_Node ~= tostring(node.id) then
		local current_Diff = node.id
		require("neo-tree.utils").open_file(state, diff_Node, open)
		vim.cmd("vert diffs " .. current_Diff)
		log.info("Diffing " .. diff_Name .. " against " .. node.name)
		diff_Node = nil
		current_Diff = nil
		state.clipboard = {}
		require("neo-tree.ui.renderer").redraw(state)
	else
		local existing = state.clipboard[node.id]
		if existing and existing.action == "diff" then
			state.clipboard[node.id] = nil
			diff_Node = nil
			require("neo-tree.ui.renderer").redraw(state)
		else
			state.clipboard[node.id] = { action = "diff", node = node }
			diff_Name = state.clipboard[node.id].node.name
			diff_Node = tostring(state.clipboard[node.id].node.id)
			log.info("Diff source file " .. diff_Name)
			require("neo-tree.ui.renderer").redraw(state)
		end
	end
end
return M
