local M = {}

M.opts = {

	bigfile = { enabled = true },
	input = {
		position = "right",
		-- your input configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	styles = {
		input = {
			relative = "cursor",
			row = -3,
			col = 0,
		},
	},
}

return M
