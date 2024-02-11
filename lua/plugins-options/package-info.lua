local M = {}
function M.config()
	require("package-info").setup({
		colors = {
			up_to_date = "#3C4048", -- Text color for up to date dependency virtual text
			outdated = "#d19a66", -- Text color for outdated dependency virtual text
		},
		icons = {
			enable = true, -- Whether to display icons
			style = {
				up_to_date = "|  ", -- Icon for up to date dependencies
				outdated = "|  ", -- Icon for outdated dependencies
			},
		},
		autostart = false, -- Whether to autostart when `package.json` is opened
		hide_up_to_date = true, -- It hides up to date versions when displaying virtual text
		hide_unstable_versions = false, -- It hides unstable versions from version list e.g next-11.1.3-canary3
		-- Can be `npm`, `yarn`, or `pnpm`. Used for `delete`, `install` etc...
		-- The plugin will try to auto-detect the package manager based on
		-- `yarn.lock` or `package-lock.json`. If none are found it will use the
		-- provided one, if nothing is provided it will use `yarn`
		package_manager = "npm",
	})
end

return M
