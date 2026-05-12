vim.pack.add({
	{ src = "https://github.com/nvim-mini/mini.statusline" },
})

local name_to_abb = {
	["biome"] = "B",
	["biome-check"] = "BC",
	["trim_whitespace"] = "TW",
	["eslint_d"] = "ES",
	["stylua"] = "SL",
	["cssmodules_ls"] = "CSSM",
	["vtsls"] = "VTS",
	["typescript-tools"] = "TS",
}
function FilePath()
	local filename = vim.fn.expand("%:.")

	return filename
end

local git_ahead_behind = "" -- Cached Git status

local last_update = 0 -- Last update time

local codeCompanion_processing = false
local group = vim.api.nvim_create_augroup("CodeCompanionHooks", {})
vim.api.nvim_create_autocmd({ "User" }, {
	pattern = "CodeCompanionRequest*",
	group = group,
	callback = function(request)
		if request.match == "CodeCompanionRequestStarted" then
			codeCompanion_processing = true
		elseif request.match == "CodeCompanionRequestFinished" then
			codeCompanion_processing = false
		end
	end,
})
local function get_codecompanion_status()
	if codeCompanion_processing then
		return string.format("CodeCompanion: processing...")
	end
	return ""
end

local function update_git_ahead_behind()
	local now = vim.loop.now()
	if now - last_update < 2000 then -- Update only every 2 seconds
		return
	end
	last_update = now

	-- Run git status asynchronously
	vim.system({ "git", "rev-list", "--left-right", "--count", "HEAD...@{upstream}" }, { text = true }, function(res)
		if res.code == 0 and res.stdout then
			local ahead, behind = res.stdout:match("(%d+)\t+(%d+)")
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
	end)
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

local function shorten_branch(branch)
	local name = branch:match("([^/]+)$") or branch
	if #name > 40 then
		name = name:sub(1, 40)
	end
	return name
end
local function get_diffview_branch()
	local ok, lib = pcall(require, "diffview.lib")
	if not ok then
		return nil
	end
	local view = lib.get_current_view()
	if not view then
		return nil
	end

	local curwin = vim.api.nvim_get_current_win()

	-- Try to identify left (a) vs right (b) side
	local layout = view.cur_layout or (view.panels and view.panels[1])
	-- StandardView uses cur_layout with .a and .b
	if layout and layout.a and layout.b then
		local a_win = layout.a.id
		local b_win = layout.b.id

		local rev_arg = view.rev_arg or ""
		-- Parse rev_arg: "v1" means v1..HEAD, "v1..v2" means left=v1, right=v2
		local left_rev, right_rev
		local r1, r2 = rev_arg:match("^(.+)%.%.%.?(.+)$")
		if r1 and r2 then
			left_rev = r1
			right_rev = r2
		elseif rev_arg ~= "" then
			left_rev = rev_arg
			right_rev = "current worktree"
		end

		if curwin == a_win and left_rev then
			return shorten_branch(left_rev)
		elseif curwin == b_win and right_rev then
			return shorten_branch(right_rev)
		elseif rev_arg ~= "" then
			return shorten_branch(rev_arg)
		end
	end

	-- Fallback: just show rev_arg
	if view.rev_arg and view.rev_arg ~= "" then
		return shorten_branch(view.rev_arg)
	end
	return nil
end

function GitBranch()
	if vim.opt_local.diff._value then
		local label = get_diffview_branch()
		if label then
			return "[ " .. label .. " ]"
		end
	end
	local branch = vim.fn.FugitiveHead()
	if branch and branch ~= "" then
		return "[ " .. shorten_branch(branch) .. git_ahead_behind .. "]"
	end
	return ""
end

require("mini.statusline").setup({
	content = {
		active = function()
			MiniStatusline.section_filename = function(args)
				if vim.bo.filetype == "fyler" then
					return ""
				end
				-- In terminal always use plain name
				if vim.bo.buftype == "terminal" then
					return "%t"
				else
					return "%{%v:lua.FilePath()%}"
				end
			end

			MiniStatusline.section_diff = function(args)
				if MiniStatusline.is_truncated(args.trunc_width) then
					return ""
				end

				local summary = vim.b.minidiff_summary_string or vim.b.gitsigns_status
				if summary == nil or summary == "" then
					return ""
				end

				local icon = ""
				return icon .. " " .. (summary == "" and "-" or summary)
			end

			MiniStatusline.section_fileinfo = function(args)
				local filetype = vim.bo.filetype

				filetype = filetype

				-- Construct output string if truncated or buffer is not normal
				if MiniStatusline.is_truncated(args.trunc_width) or vim.bo.buftype ~= "" then
					return filetype
				end
				return string.format("%s", filetype)
			end

			MiniStatusline.section_lsp = function(args)
				local bufnr = vim.api.nvim_get_current_buf()
				local clients = vim.lsp.get_clients({ bufnr = bufnr })
				if next(clients) == nil then
					return ""
				end
				local clients_name = {}
				-- map client names to abbreviations
				for i, client in ipairs(clients) do
					clients_name[i] = name_to_abb[client.name] or client.name
				end
				return " [" .. table.concat(clients_name, ", ") .. "]"
			end
			MiniStatusline.section_git = function(args)
				if MiniStatusline.is_truncated(args.trunc_width) then
					return ""
				end
				return GitBranch()
			end
			-- MiniStatusline.section_git = function(args)
			-- 	if MiniStatusline.is_truncated(args.trunc_width) then
			-- 		return ""
			-- 	end
			--
			--              local summary
			-- 	local icon = ""
			-- 	return icon .. " " .. (summary == "" and "-" or summary)
			-- end

			local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
			local git = MiniStatusline.section_git({ trunc_width = 40 })
			local diff = MiniStatusline.section_diff({ trunc_width = 75 })
			local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
			local lsp = MiniStatusline.section_lsp({ trunc_width = 75 })
			local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
			local location = MiniStatusline.section_location({ trunc_width = 75 })
			local search = MiniStatusline.section_searchcount({ trunc_width = 75 })
            local codecompanion = get_codecompanion_status()

			return MiniStatusline.combine_groups({
				{ hl = mode_hl, strings = { mode } },
				{ hl = "MiniStatuslineDevinfo", strings = { git, diff } },
				"%<", -- Mark general truncate point
				"%=", -- End left alignment
				{ hl = "MiniStatuslineProgressInfo", strings = { codecompanion } },
				{ hl = "MiniStatuslineDevinfo", strings = { diagnostics, lsp } },
				{ hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
				{ hl = mode_hl, strings = { search, location } },
			})
		end,
		inactive = function()
			MiniStatusline.section_filename = function(args)
				if vim.bo.filetype == "fyler" then
					return ""
				end
				-- In terminal always use plain name
				if vim.bo.buftype == "terminal" then
					return "%t"
				else
					return "%{%v:lua.FilePath()%}"
				end
			end

			MiniStatusline.section_diff = function(args)
				if MiniStatusline.is_truncated(args.trunc_width) then
					return ""
				end

				local summary = vim.b.minidiff_summary_string or vim.b.gitsigns_status
				if summary == nil or summary == "" then
					return ""
				end

				local icon = ""
				return icon .. " " .. (summary == "" and "-" or summary)
			end

			MiniStatusline.section_fileinfo = function(args)
				local filetype = vim.bo.filetype

				filetype = filetype

				-- Construct output string if truncated or buffer is not normal
				if MiniStatusline.is_truncated(args.trunc_width) or vim.bo.buftype ~= "" then
					return filetype
				end
				return string.format("%s", filetype)
			end

			MiniStatusline.section_lsp = function(args)
				local bufnr = vim.api.nvim_get_current_buf()
				local clients = vim.lsp.get_clients({ bufnr = bufnr })
				if next(clients) == nil then
					return ""
				end
				local clients_name = {}
				-- map client names to abbreviations
				for i, client in ipairs(clients) do
					clients_name[i] = name_to_abb[client.name] or client.name
				end
				return " [" .. table.concat(clients_name, ", ") .. "]"
			end
			-- MiniStatusline.section_git = function(args)
			-- 	if MiniStatusline.is_truncated(args.trunc_width) then
			-- 		return ""
			-- 	end
			--
			--              local summary
			-- 	local icon = ""
			-- 	return icon .. " " .. (summary == "" and "-" or summary)
			-- end

			local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
			local git = MiniStatusline.section_git({ trunc_width = 40 })
			local diff = MiniStatusline.section_diff({ trunc_width = 75 })
			local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
			local lsp = MiniStatusline.section_lsp({ trunc_width = 75 })
			local filename = MiniStatusline.section_filename({ trunc_width = 140 })
			local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
			local location = MiniStatusline.section_location({ trunc_width = 75 })
			local search = MiniStatusline.section_searchcount({ trunc_width = 75 })

			return MiniStatusline.combine_groups({
				{ hl = mode_hl, strings = { mode } },
				{ hl = "MiniStatuslineDevinfo", strings = { git, diff } },
				"%<", -- Mark general truncate point
				-- { hl = "MiniStatuslineDevinfo" or "", strings = { git } },
				"%=", -- End left alignment
				{ hl = "MiniStatuslineDevinfo", strings = { diagnostics, lsp } },
				{ hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
				{ hl = mode_hl, strings = { search, location } },
			})
		end,
		-- inactive = function()
		-- 	MiniStatusline.section_filename = function(args)
		-- 		if vim.bo.filetype == "fyler" then
		-- 			return ""
		-- 		end
		-- 		-- In terminal always use plain name
		-- 		if vim.bo.buftype == "terminal" then
		-- 			return "%t"
		-- 		else
		-- 			return "%{%v:lua.FilePath()%}"
		-- 		end
		-- 	end
		-- 	local filename = MiniStatusline.section_filename({ trunc_width = 140 })
		-- 	local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
		-- 	return MiniStatusline.combine_groups({
		-- 		{ hl = "MiniStatuslineInactive", strings = { filename } },
		-- 		"%=", -- End left alignment
		-- 		{ hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
		-- 	})
		-- end,
	},
})
