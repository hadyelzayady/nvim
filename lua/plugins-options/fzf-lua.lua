local M = {}

function M.config()
	local fzf = require("fzf-lua")
	fzf.setup({
		"max-perf",
	})
	fzf.register_ui_select()
end

return M
