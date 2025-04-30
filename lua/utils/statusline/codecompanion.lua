local M = {}
local group = vim.api.nvim_create_augroup("CodeCompanionHooks", {})

function M.init()
	vim.api.nvim_create_autocmd({ "User" }, {
		pattern = "CodeCompanionRequest*",
		group = group,
		callback = function(request)
			if request.match == "CodeCompanionRequestStarted" then
				M.processing = true
				vim.cmd("redrawstatus")
			elseif request.match == "CodeCompanionRequestFinished" then
				M.processing = false
				vim.cmd("redrawstatus")
			end
		end,
	})
end

function M.get_codecompanion_status()
	if M.processing then
		return string.format("CodeCompanion: processing...")
	end
	return ""
end

return M
