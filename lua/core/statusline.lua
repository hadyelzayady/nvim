local icons = require("utils.ui-components").icons

function GitFileStatus()
	local file = vim.fn.expand("%:p") -- Get absolute file path
	if file == "" then
		return ""
	end
	local cmd = "git status --porcelain " .. vim.fn.shellescape(file)
	local status = vim.fn.system(cmd):sub(1, 2)

	local symbols = {
		[" M"] = icons.git.modified, -- Modified
		["M "] = icons.git.staged, -- Staged
		["??"] = icons.git.untracked, -- Untracked
		[" D"] = icons.git.removed, -- Deleted
		["A "] = icons.git.added, -- Added
		[" R"] = icons.git.renamed, -- Renamed
	}
	return symbols[status] or ""
end

function GitAheadBehind()
	local status = vim.fn.system("git rev-list --left-right --count HEAD...@{upstream} 2>/dev/null")
	local ahead, behind = status:match("(%d+)%s+(%d+)")
	ahead, behind = tonumber(ahead), tonumber(behind)
	local result = ""
	if ahead and ahead > 0 then
		result = result .. " ⇡" .. ahead .. " "
	end
	if behind and behind > 0 then
		result = result .. " ⇣" .. behind
	end
	return result
end

function GitBranch()
	local branch = vim.fn.FugitiveHead()
	if branch and branch ~= "" then
		return "[ " .. branch .. GitAheadBehind() .. "]"
	end
	return ""
end
local mode_colors = {
	n = "%#StatusLineNormal# N ",
	i = "%#StatusLineInsert# I ",
	v = "%#StatusLineVisual# V ",
	V = "%#StatusLineVitual# V-L ",
	[""] = "%#StatusMode# V-B ",
	c = "%#StatusMode# C ",
	R = "%#StatusLineReplace# R ",
	t = "%#StatusMode# T ",
}

function StatuslineMode()
	local mode_code = vim.api.nvim_get_mode().mode
	local color = mode_colors[mode_code]
	return color
end

function Lsp()
	local clients = require("utils.lsp").get_buffer_attached_lsp()
	if next(clients) == nil then
		return ""
	end
	return " [" .. table.concat(clients, ", ") .. "]"
end

function Formatter()
	local active = require("conform").list_formatters_to_run()
	local formatters = {}
	for _, value in ipairs(active) do
		if value.available then
			table.insert(formatters, value.name)
		end
	end
	return "🎨[" .. table.concat(formatters, ", ") .. "]"
end

local function getDiagnosticLevelStatus(severity)
	local count = #vim.diagnostic.get(0, { severity = severity })
	local severityText = require("utils.diagnostics").severity_to_text_map[severity]
	if count > 0 then
		return "%#DiagnosticSign" .. severityText .. "#" .. icons.diagnostics[severityText] .. count .. " "
	end
	return ""
end

function DiagnosticsStatus()
	return table.concat({
		getDiagnosticLevelStatus(vim.diagnostic.severity.ERROR),
		getDiagnosticLevelStatus(vim.diagnostic.severity.WARN),
		getDiagnosticLevelStatus(vim.diagnostic.severity.INFO),
		getDiagnosticLevelStatus(vim.diagnostic.severity.HINT),
	})
end

function LspProgress()
	local messages = vim.lsp.status()
	return messages
end

function StatuslineSelection()
	local mode = vim.fn.mode()
	if mode == "V" or mode == "v" or mode == "\22" then
		local _, start_lnum, _, _ = unpack(vim.fn.getpos("v")) -- Visual selection start
		local _, end_lnum, _, _ = unpack(vim.fn.getpos(".")) -- Visual selection end
		local lines_selected = math.abs(end_lnum - start_lnum) + 1
		return " [" .. lines_selected .. "L] " -- Display selected lines count
	end
	return ""
end

vim.o.statusline = table.concat({
	"%{%v:lua.StatuslineMode()%}",
	"%#StatusLineGit# %{%v:lua.GitBranch()%} %{%v:lua.GitFileStatus()%}",
	"%=", -- Align center
	"%#StatusLineInfo# %{%v:lua.DiagnosticsStatus()%}",
	"%=", -- Align right
	"%{%v:lua.LspProgress()%}",
	"%#StatusLineLSP# %{v:lua.Formatter()} %{v:lua.Lsp()}",
	" %y",
	"%{v:lua.StatuslineSelection()}",
	" %l:%c %p%% / %L",
})
