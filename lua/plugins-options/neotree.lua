local M = {}

function M.config()
	local neotree_utils = require("utils.neotree")
	require("neo-tree").setup({
		filesystem = {
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
			git_status = {
				symbols = {
					-- Change type
					added = require("utils.ui-components").icons.git.added,
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
			},
			diagnostics = {
				symbols = {
					hint = require("utils.ui-components").icons.diagnostics.Hint,
					info = require("utils.ui-components").icons.diagnostics.Info,
					warn = require("utils.ui-components").icons.diagnostics.Warn,
					error = require("utils.ui-components").icons.diagnostics.Error,
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
