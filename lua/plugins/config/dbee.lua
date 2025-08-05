local M = {}
function M.config()
	require("dbee").setup({
		-- editor window config
		editor = {
			mappings = {
				-- run what's currently selected on the active connection
				{ key = "<space>r", mode = "v", action = "run_selection" },
				-- run the whole file on the active connection
				{ key = "<space>r", mode = "n", action = "run_file" },
				-- run what's under the cursor to the next newline
				{ key = "<CR>", mode = "n", action = "run_under_cursor" },
			},
		},
	})
end
return M
