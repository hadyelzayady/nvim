local git_ahead_behind = "" -- Cached Git status

local last_update = 0 -- Last update time

local function update_git_ahead_behind()
	local now = vim.loop.now()
	if now - last_update < 2000 then -- Update only every 2 seconds
		return
	end
	last_update = now

	-- Run git status asynchronously
	vim.system(
		{ "git", "rev-list", "--left-right", "--count", "HEAD...@{upstream}", "2>/dev/null" },
		{ text = true },
		function(res)
			if res.code == 0 and res.stdout then
				local status = res.stdout:match("(%d+)%s+(%d+)")
				local ahead, behind = status:match("(%d+)%s+(%d+)")
				ahead, behind = tonumber(ahead), tonumber(behind)
				local result = ""
				if ahead and ahead > 0 then
					result = result .. " ⇡" .. ahead .. " "
				end
				if behind and behind > 0 then
					result = result .. " ⇣" .. behind
				end
				git_ahead_behind = result
			end
		end
	)
end

-- Run update on events instead of every redraw
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "CursorHold" }, {
	callback = function()
		update_git_ahead_behind()
		vim.schedule(function()
			vim.cmd("redrawstatus")
		end)
	end,
})

local M = {}

function M.GitAheadBehind()
	return git_ahead_behind
end
return M
