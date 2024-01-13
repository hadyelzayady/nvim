local M = {}
local diff_files = function(state)
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
local function on_file_remove(args)
	require("plugins.lsp.rename_file").rename_file({ old_name = args.source, new_name = args.destination })
end

M.opts = {
	sources = {
		"filesystem",
		"git_status",
		"buffers",
	},

	source_selector = {
		winbar = true, -- toggle to show selector on winbar
	},
	enable_normal_mode_for_inputs = false, -- Enable normal mode for input dialogs.
	default_component_configs = {
		icon = {
			folder_closed = "",
			folder_open = "",
			folder_empty = "󰜌",
			-- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
			-- then these will never be used.
			default = "*",
			highlight = "NeoTreeFileIcon",
		},
		modified = {
			symbol = "[+]",
			highlight = "NeoTreeModified",
		},
		name = {
			trailing_slash = false,
			use_git_status_colors = true,
			highlight = "NeoTreeFileName",
		},
		git_status = {
			symbols = {
				-- Change type
				added = require("utils.ui-components").icons.git.added, -- NOTE: you can set any of these to an empty string to not show them
				deleted = require("utils.ui-components").icons.git.deleted,
				modified = require("utils.ui-components").icons.git.modified,
				renamed = require("utils.ui-components").icons.git.renamed,
				-- Status type
				untracked = require("utils.ui-components").icons.git.untracked,
				ignored = require("utils.ui-components").icons.git.ignored,
				unstaged = require("utils.ui-components").icons.git.unstaged,
				staged = require("utils.ui-components").icons.git.staged,
				conflict = require("utils.ui-components").icons.git.conflict,
			},
			align = "right",
		},
	},
	-- A list of functions, each representing a global custom command
	-- that will be available in all sources (if not overridden in `opts[source_name].commands`)
	-- see `:h neo-tree-custom-commands-global`
	commands = {
		git_diff_file = function(state)
			local node = state.tree:get_node()
			local file = node:get_id()
			vim.cmd("DiffviewOpen -- " .. file)
		end,
		git_diff = function()
			vim.cmd("DiffviewOpen")
		end,
		copy_absolute_path_to_system_clipboard = function(state)
			local node = state.tree:get_node()
			local path = node:get_id()
			-- macOs: open file in default application in the background.
			-- Probably you need to adapt the Linux recipe for manage path with spaces. I don't have a mac to try.
			os.execute("echo " .. path .. " | xclip -selection clipboard")
		end,
		paste_from_system_clipboard = function(state)
			local file_path = require("utils.functions").os_capture("xclip -o -selection clipboard")
			local node = state.tree:get_node()
			local parent_path = node:get_parent_id()
			os.execute("cp -rf " .. '"' .. file_path .. '"' .. " " .. node.path)
			vim.cmd("Neotree show")
		end,
	},
	window = {
		mappings = {
			["<space>cc"] = "copy_absolute_path_to_system_clipboard",
			["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
		},
	},
	nesting_rules = {},
	filesystem = {
		display_name = " Files",
		filtered_items = {
			always_show = { -- remains visible even if other settings would normally hide it
				--".gitignored",
				".env.development.local",
			},
		},
		follow_current_file = {
			enabled = false, -- This will find and focus the file in the active buffer every time
			--               -- the current file is changed while the tree is open.
			leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
		},
		group_empty_dirs = false, -- when true, empty folders will be grouped together
		hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
		-- in whatever position is specified in window.position
		-- "open_current",  -- netrw disabled, opening a directory opens within the
		-- window like netrw would, regardless of window.position
		-- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
		use_libuv_file_watcher = false, -- This will use the OS level file watchers to detect changes
		-- instead of relying on nvim autocmd events.
		window = {
			mappings = {
				["<space>i"] = "run_command",
				["<space>D"] = diff_files,
				["<space>o"] = "system_open",
				["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
			},
		},

		commands = {
			system_open = function(state)
				local node = state.tree:get_node()
				local path = node:get_id()
				-- macOs: open file in default application in the background.
				-- vim.fn.jobstart({ "xdg-open", "-g", path }, { detach = true })
				-- Linux: open file in default application
				vim.fn.jobstart({ "xdg-open", path }, { detach = true })
			end,
			run_command = function(state)
				local node = state.tree:get_node()
				local path = node:get_id()
				vim.api.nvim_input(": " .. path .. "<Home>")
			end,
			-- Override delete to use trash instead of rm
			delete = function(state)
				local inputs = require("neo-tree.ui.inputs")
				local path = state.tree:get_node().path
				local msg = "Are you sure you want to delete " .. path
				inputs.confirm(msg, function(confirmed)
					if not confirmed then
						return
					end

					vim.fn.system({ "trash", "-r", vim.fn.fnameescape(path) })
					require("neo-tree.sources.manager").refresh(state.name)
				end)
			end,
		}, -- Add a custom command or override a global one using the same function name
		components = {
			-- harpoon_index = function(config, node)
			-- 	local Marked = require("harpoon.mark")
			-- 	local path = node:get_id()
			-- 	local succuss, index = pcall(Marked.get_index_of, path)
			-- 	if succuss and index and index > 0 then
			-- 		return {
			-- 			text = string.format(" ⥤ %d", index), -- <-- Add your favorite harpoon like arrow here
			-- 			highlight = config.highlight or "NeoTreeDirectoryIcon",
			-- 		}
			-- 	else
			-- 		return {}
			-- 	end
			-- end,
			name = function(config, node, state)
				local components = require("neo-tree.sources.common.components")
				local name = components.name(config, node, state)
				if node:get_depth() == 1 then
					name.text = vim.fs.basename(vim.loop.cwd() or "")
				end
				return name
			end,
		},
		renderers = {
			file = {
				{ "indent" },
				{ "icon" },
				{
					"container",
					content = {
						{
							"name",
							zindex = 10,
						},
						{ "clipboard", zindex = 10 },
						-- { "harpoon_index", zindex = 10 }, --> This is what actually adds the component in where you want it
						{ "modified", zindex = 20, align = "right" },
						{ "diagnostics", zindex = 20, align = "right" },
						{ "git_status", zindex = 20, align = "right" },
					},
				},
			},
		},
	},
	git_status = {
		window = {
			mappings = {
				["d"] = "git_diff_file",
				["D"] = "git_diff",
			},
		},
	},
	event_handlers = {
		{
			event = "file_renamed",
			handler = on_file_remove,
		},
		{
			event = "file_moved",
			handler = on_file_remove,
		},
	},
}

return M
