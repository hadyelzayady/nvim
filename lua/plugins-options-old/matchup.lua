local M = {}

function M.config()
	vim.g.matchup_matchparen_deferred = 1 -- work async
	-- vim.g.matchup_matchparen_offscreen = {} -- disable status bar icon
	vim.g.matchup_matchparen_offscreen = { method = "popup" }
	vim.g.matchup_matchpref = {
		typescriptreact = {
			tagnameonly = 1,
		},
		javacriptreact = {
			tagnameonly = 1,
		},
		html = {
			tagnameonly = 1,
		},
	}
end

return M
