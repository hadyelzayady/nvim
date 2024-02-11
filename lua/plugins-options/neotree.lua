local M = {}

function M.config()
	require("neo-tree").setup({
		filesystem = {
			-- "open_current"
			-- "open_current",
			-- "disabled",
			hijack_netrw_behavior = "disabled",
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
