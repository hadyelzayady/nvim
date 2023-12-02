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
	hide_root_node = false, -- Hide the root node.
	retain_hidden_root_indent = true, -- IF the root node is hidden, keep the indentation anyhow.
	-- This is needed if you use expanders because they render in the indent.
	add_blank_line_at_top = false, -- Add a blank line at the top of the tree.
	auto_clean_after_session_restore = true, -- Automatically clean up broken neo-tree buffers saved in sessions

	sources = {
		"filesystem",
		"git_status",
		"buffers",
	},

	source_selector = {
		winbar = true, -- toggle to show selector on winbar
		statusline = false, -- toggle to show selector on statusline
		show_scrolled_off_parent_node = true, -- this will replace the tabs with the parent path
		-- of the top visible node when scrolled down.
		sources = {
			{ source = "filesystem" },
			{ source = "git_status" },
			{ source = "buffers" },
			{ source = "document_symbols" },
		},
		content_layout = "start", -- only with `tabs_layout` = "equal", "focus"
		--                start  : |/ 裡 bufname     \/...
		--                end    : |/     裡 bufname \/...
		--                center : |/   裡 bufname   \/...
		tabs_layout = "equal", -- start, end, center, equal, focus
		--             start  : |/  a  \/  b  \/  c  \            |
		--             end    : |            /  a  \/  b  \/  c  \|
		--             center : |      /  a  \/  b  \/  c  \      |
		--             equal  : |/    a    \/    b    \/    c    \|
		--             active : |/  focused tab    \/  b  \/  c  \|
		truncation_character = "…", -- character to use when truncating the tab label
		tabs_min_width = nil, -- nil | int: if int padding is added based on `content_layout`
		tabs_max_width = nil, -- this will truncate text even if `text_trunc_to_fit = false`
		padding = 0, -- can be int or table
		-- padding = { left = 2, right = 0 },
		-- separator = "▕", -- can be string or table, see below
		separator = { left = "▏", right = "▕" },
		-- separator = { left = "/", right = "\\", override = nil },     -- |/  a  \/  b  \/  c  \...
		-- separator = { left = "/", right = "\\", override = "right" }, -- |/  a  \  b  \  c  \...
		-- separator = { left = "/", right = "\\", override = "left" },  -- |/  a  /  b  /  c  /...
		-- separator = { left = "/", right = "\\", override = "active" },-- |/  a  / b:active \  c  \...
		-- separator = "|",                                              -- ||  a  |  b  |  c  |...
		separator_active = nil, -- set separators around the active tab. nil falls back to `source_selector.separator`
		show_separator_on_edge = false,
		--                       true  : |/    a    \/    b    \/    c    \|
		--                       false : |     a    \/    b    \/    c     |
		highlight_tab = "NeoTreeTabInactive",
		highlight_tab_active = "NeoTreeTabActive",
		highlight_background = "NeoTreeTabInactive",
		highlight_separator = "NeoTreeTabSeparatorInactive",
		highlight_separator_active = "NeoTreeTabSeparatorActive",
	},
	close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
	popup_border_style = "rounded",
	enable_git_status = true,
	enable_diagnostics = true,
	enable_normal_mode_for_inputs = false, -- Enable normal mode for input dialogs.
	open_files_do_not_replace_types = { "terminal", "trouble", "qf" }, -- when opening files, do not use windows containing these filetypes or buftypes
	sort_case_insensitive = false, -- used when sorting files and directories in the tree
	sort_function = nil, -- use a custom function for sorting files and directories in the tree
	-- sort_function = function (a,b)
	--       if a.type == b.type then
	--           return a.path > b.path
	--       else
	--           return a.type > b.type
	--       end
	--   end , -- this sorts files and directories descendantly
	default_component_configs = {
		container = {
			enable_character_fade = true,
		},
		indent = {
			indent_size = 2,
			padding = 1, -- extra padding on left hand side
			-- indent guides
			with_markers = true,
			indent_marker = "│",
			last_indent_marker = "└",
			highlight = "NeoTreeIndentMarker",
			-- expander config, needed for nesting files
			with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
			expander_collapsed = "",
			expander_expanded = "",
			expander_highlight = "NeoTreeExpander",
		},
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

		-- If you don't want to use these columns, you can set `enabled = false` for each of them individually
		file_size = {
			enabled = true,
			required_width = 64, -- min width of window required to show this column
		},
		type = {
			enabled = true,
			required_width = 122, -- min width of window required to show this column
		},
		last_modified = {
			enabled = true,
			required_width = 88, -- min width of window required to show this column
		},
		created = {
			enabled = true,
			required_width = 110, -- min width of window required to show this column
		},
		symlink_target = {
			enabled = false,
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
		position = "left",
		width = 40,
		mapping_options = {
			noremap = true,
			nowait = true,
		},
		mappings = {
			["<space>"] = {
				"toggle_node",
				nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
			},
			["<2-LeftMouse>"] = "open",
			["<cr>"] = "open",
			["<esc>"] = "cancel", -- close preview or floating neo-tree window
			["P"] = { "toggle_preview", config = { use_float = true } },
			["l"] = "focus_preview",
			["S"] = "open_split",
			["s"] = "open_vsplit",
			-- ["S"] = "split_with_window_picker",
			-- ["s"] = "vsplit_with_window_picker",
			["t"] = "open_tabnew",
			-- ["<cr>"] = "open_drop",
			-- ["t"] = "open_tab_drop",
			["w"] = "open_with_window_picker",
			--["P"] = "toggle_preview", -- enter preview mode, which shows the current node without focusing
			["C"] = "close_node",
			-- ['C'] = 'close_all_subnodes',
			["z"] = "close_all_nodes",
			--["Z"] = "expand_all_nodes",
			["a"] = {
				"add",
				-- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:h neo-tree-file-actions` for details
				-- some commands may take optional config options, see `:h neo-tree-mappings` for details
				config = {
					show_path = "none", -- "none", "relative", "absolute"
				},
			},
			["A"] = "add_directory", -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
			["d"] = "delete",
			["r"] = "rename",
			["y"] = "copy_to_clipboard",
			["x"] = "cut_to_clipboard",
			["p"] = "paste_from_clipboard",
			["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
			["<space>cc"] = "copy_absolute_path_to_system_clipboard",
			["<space>p"] = "paste_from_system_clipboard",
			-- ["c"] = {
			--  "copy",
			--  config = {
			--    show_path = "none" -- "none", "relative", "absolute"
			--  }
			--}
			["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
			["q"] = "close_window",
			["R"] = "refresh",
			["?"] = "show_help",
			["<"] = "prev_source",
			[">"] = "next_source",
			["i"] = "show_file_details",
		},
	},
	nesting_rules = {},
	filesystem = {
		display_name = " Files",
		filtered_items = {
			visible = false, -- when true, they will just be displayed differently than normal items
			hide_dotfiles = true,
			hide_gitignored = true,
			hide_hidden = true, -- only works on Windows for hidden files/directories
			hide_by_name = {
				--"node_modules"
			},
			hide_by_pattern = { -- uses glob style patterns
				--"*.meta",
				--"*/src/*/tsconfig.json",
			},
			always_show = { -- remains visible even if other settings would normally hide it
				--".gitignored",
				".env.development.local",
			},
			never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
				--".DS_Store",
				--"thumbs.db"
			},
			never_show_by_pattern = { -- uses glob style patterns
				--".null-ls_*",
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
				["<bs>"] = "navigate_up",
				["."] = "set_root",
				["H"] = "toggle_hidden",
				["/"] = "fuzzy_finder",
				["D"] = "fuzzy_finder_directory",
				["#"] = "fuzzy_sorter", -- fuzzy sorting using the fzy algorithm
				["f"] = "filter_on_submit",
				["<c-x>"] = "clear_filter",
				["[g"] = "prev_git_modified",
				["]g"] = "next_git_modified",
				["o"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "o" } },
				["oc"] = { "order_by_created", nowait = false },
				["od"] = { "order_by_diagnostics", nowait = false },
				["og"] = { "order_by_git_status", nowait = false },
				["om"] = { "order_by_modified", nowait = false },
				["on"] = { "order_by_name", nowait = false },
				["os"] = { "order_by_size", nowait = false },
				["ot"] = { "order_by_type", nowait = false },
			},
			fuzzy_finder_mappings = { -- define keymaps for filter popup window in fuzzy_finder_mode
				["<down>"] = "move_cursor_down",
				["<C-n>"] = "move_cursor_down",
				["<up>"] = "move_cursor_up",
				["<C-p>"] = "move_cursor_up",
			},
		},

		commands = {
			system_open = function(state)
				local node = state.tree:get_node()
				local path = node:get_id()
				-- macOs: open file in default application in the background.
				vim.fn.jobstart({ "xdg-open", "-g", path }, { detach = true })
				-- Linux: open file in default application
				vim.fn.jobstart({ "xdg-open", path }, { detach = true })
			end,
			run_command = function(state)
				local node = state.tree:get_node()
				local path = node:get_id()
				vim.api.nvim_input(": " .. path .. "<Home>")
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
	buffers = {
		follow_current_file = {
			enabled = true, -- This will find and focus the file in the active buffer every time
			--              -- the current file is changed while the tree is open.
			leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
		},
		group_empty_dirs = true, -- when true, empty folders will be grouped together
		show_unloaded = true,
		window = {
			mappings = {
				["bd"] = "buffer_delete",
				["<bs>"] = "navigate_up",
				["."] = "set_root",
				["o"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "o" } },
				["oc"] = { "order_by_created", nowait = false },
				["od"] = { "order_by_diagnostics", nowait = false },
				["om"] = { "order_by_modified", nowait = false },
				["on"] = { "order_by_name", nowait = false },
				["os"] = { "order_by_size", nowait = false },
				["ot"] = { "order_by_type", nowait = false },
			},
		},
	},
	git_status = {
		window = {
			position = "float",
			mappings = {
				["A"] = "git_add_all",
				["gu"] = "git_unstage_file",
				["ga"] = "git_add_file",
				["gr"] = "git_revert_file",
				["gc"] = "git_commit",
				["gp"] = "git_push",
				["gg"] = "git_commit_and_push",
				["o"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "o" } },
				["oc"] = { "order_by_created", nowait = false },
				["od"] = { "order_by_diagnostics", nowait = false },
				["om"] = { "order_by_modified", nowait = false },
				["on"] = { "order_by_name", nowait = false },
				["os"] = { "order_by_size", nowait = false },
				["ot"] = { "order_by_type", nowait = false },
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
