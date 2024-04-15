local M = {}

function M.config()
	local neotree_utils = require("utils.neotree")
	local icons = require("utils.ui-components").icons
	require("neo-tree").setup({
		filesystem = {
			follow_current_file = {
				enabled = true, -- This will find and focus the file in the active buffer every time
				--               -- the current file is changed while the tree is open.
				leave_dirs_open = true, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
			},
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
			hide_root_node = true, -- Hide the root node.
			hijack_netrw_behavior = "disabled",
			commands = {
				copy_absolute_path_to_system_clipboard = neotree_utils.copy_absolute_path_to_system_clipboard,
				paste_from_system_clipboard = neotree_utils.paste_from_system_clipboard,
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

			window = {
				mappings = {
					["<space>i"] = "run_command",
					["<space>D"] = neotree_utils.diff_files,
					["<space>o"] = "system_open",
					["<space>cc"] = "copy_absolute_path_to_system_clipboard",
					["<space>p"] = "paste_from_system_clipboard",
					["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
				},
			},
		},

		commands = {
			git_diff_file = neotree_utils.git_diff_file,
			git_diff = neotree_utils.git_diff,
		},
		git_status = {
			window = {
				mappings = {
					["d"] = "git_diff_file",
					["D"] = "git_diff",
				},
			},
		},
		default_component_configs = {
			icon = {
				folder_closed = icons.folder.closed,
				folder_open = icons.folder.opened,
				folder_empty = icons.folder.empty,
				-- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
				-- then these will never be used.
				default = "*",
				highlight = "NeoTreeFileIcon",
			},
			git_status = {
				symbols = {
					-- Change type
					added = icons.git.added,
					deleted = icons.git.deleted,
					modified = icons.git.modified,
					renamed = icons.git.renamed,
					-- Status type
					untracked = icons.git.untracked,
					ignored = icons.git.ignored,
					unstaged = icons.git.unstaged,
					staged = icons.git.staged,
					conflict = icons.git.conflict,
				},
			},
			diagnostics = {
				symbols = {
					hint = icons.diagnostics.Hint,
					info = icons.diagnostics.Info,
					warn = icons.diagnostics.Warn,
					error = icons.diagnostics.Error,
				},
				highlights = {
					hint = "DiagnosticSignHint",
					info = "DiagnosticSignInfo",
					warn = "DiagnosticSignWarn",
					error = "DiagnosticSignError",
				},
			},
		},
	})
end

return M
