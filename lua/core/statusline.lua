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
	return "%#StatusGit# " .. (symbols[status] or "")
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
	if branch then
		return "[ " .. branch .. GitAheadBehind() .. "]"
	end
	return ""
end
local mode_colors = {
	n = "%#StatusNormal# NORMAL ",
	i = "%#StatusInsert# INSERT ",
	v = "%#StatusVisual# VISUAL ",
	V = "%#StatusMode# V-LINE ",
	[""] = "%#StatusMode# V-BLOCK ",
	c = "%#StatusMode# COMMAND ",
	R = "%#StatusMode# REPLACE ",
	t = "%#StatusMode# TERMINAL ",
}

function statusline_mode()
	local mode_code = vim.api.nvim_get_mode().mode
	local mode = mode_colors[mode_code] or mode_code
	local color = mode_colors[mode_code]
	return color
end

function lsp()
	local clients = require("utils.lsp").get_buffer_attached_lsp()
	if next(clients) == nil then
		return ""
	end
	return " [" .. table.concat(clients, ", ") .. "]"
end
function formatter()
	local active = require("conform").list_formatters_to_run()
	local formatters = {}
	for _, value in ipairs(active) do
		if value.available then
			table.insert(formatters, value.name)
		end
	end
	return "🎨[" .. table.concat(formatters, ", ") .. "]"
end
-- vim.api.nvim_set_hl(0, "StatusNormal", { fg = "#98c379", bold = true })
-- vim.api.nvim_set_hl(0, "StatusInsert", { fg = "#e06c75", bold = true })
-- vim.api.nvim_set_hl(0, "StatusVisual", { fg = "#c678dd", bold = true })
-- vim.api.nvim_set_hl(0, "StatusCommand", { fg = "#d19a66", bold = true })
-- vim.api.nvim_set_hl(0, "StatusReplace", { fg = "#56b6c2", bold = true })
-- vim.api.nvim_set_hl(0, "StatusTerminal", { fg = "#61afef", bold = true })
--
-- vim.api.nvim_set_hl(0, "StatusMode",      { fg = "#1a1b26", bg = "#7aa2f7", bold = true })
-- vim.api.nvim_set_hl(0, "StatusBranch",    { fg = "#7aa2f7", bg = "#1a1b26", bold = true })
-- vim.api.nvim_set_hl(0, "StatusGit",       { fg = "#f7768e", bg = "#1a1b26", bold = true }) -- Modified files
-- vim.api.nvim_set_hl(0, "StatusSeparator", { fg = "#565f89", bg = "#1a1b26" })
-- vim.api.nvim_set_hl(0, "StatusLineInfo",  { fg = "#bb9af7", bg = "#1a1b26", bold = true })

vim.o.statusline =
	"%{%v:lua.statusline_mode()%}%{%v:lua.GitBranch()%}%{%v:lua.GitFileStatus()%} %= %{v:lua.formatter()} %{v:lua.lsp()} %l:%c %p%%"
