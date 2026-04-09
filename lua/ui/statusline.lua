require("utils.statusline.unsavedbuffer")
local icons = require("ui.icons").icons
local autocmd = vim.api.nvim_create_autocmd

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
local function augroup(name)
	return vim.api.nvim_create_augroup("hady_" .. name, { clear = true })
end

function GitFileStatus()
	return vim.b.gitsigns_status or ""
end

function GitAheadBehind()
	return require("utils.statusline.gitstatus").GitAheadBehind()
end

local function shorten_branch(branch)
	local name = branch:match("([^/]+)$") or branch
	if #name > 40 then
		name = name:sub(1, 40)
	end
	return name
end

local function git_heads_for_commit(commit)
	local refs = vim.fn.systemlist({ "git", "for-each-ref", "--points-at", commit, "--format=%(refname:short)" })
	-- Remove empty lines and whitespace
	local heads = {}
	for _, ref in ipairs(refs) do
		ref = vim.trim(ref)
		if ref ~= "" then
			table.insert(heads, ref)
		end
	end
	return heads
end

local function log_to_file(filename, content)
	local f = io.open(filename, "a")
	if f then
		f:write(content .. "\n")
		f:close()
	end
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
	if vim.bo.filetype == "CHADTree" then
		return ""
	end

	if vim.opt_local.diff._value then

		local label = get_diffview_branch()
		if label then
			return "[ " .. label .. " ]"
		end
		-- local ok, lib = pcall(require, "diffview.lib")
		-- if ok then
		-- 	local view = lib.get_current_view()
		-- 	local diffArgs = view.rev_arg
		-- 	if view and diffArgs then
		-- 		return diffArgs
		-- 	end
		-- end
	end
	-- if vim.opt_local.diff._value then
	--     return "Diff: " ..  ""
	-- end
	local branch = vim.fn.FugitiveHead()
	if branch and branch ~= "" then
		return "[ " .. shorten_branch(branch) .. GitAheadBehind() .. "]"
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
	-- map client names to abbreviations
	for i, name in ipairs(clients) do
		clients[i] = name_to_abb[name] or name
	end
	return " [" .. table.concat(clients, ", ") .. "]"
end

function Formatter()
	if not vim.bo.modifiable then
		return ""
	end
	---@diagnostic disable-next-line: different-requires
	local active = require("conform").list_formatters_to_run()
	local formatters = {}
	for _, value in ipairs(active) do
		if value.available then
			table.insert(formatters, name_to_abb[value.name] or value.name)
		end
	end
	if #formatters == 0 then
		return ""
	end
	return "🎨{" .. table.concat(formatters, ", ") .. "}"
end

local function getDiagnosticLevelStatus(severity)
	local count = #vim.diagnostic.get(0, { severity = severity })
	local severityText = require("utils.lsp.diagnostics").severity_to_text_map[severity]
	if count > 0 then
		return "%#DiagnosticSign" .. severityText .. "#" .. icons.diagnostics[severityText] .. count .. " "
	end
	return ""
end

function GetLoadingProjectDiag()
	local project_diag_status = require("lsp.commands.workspaceDiagnostics").loading
	local pending = {}
	for key, v in pairs(project_diag_status) do
		if v then
			pending[#pending + 1] = key
		end
	end
	local loading_status = ""
	if #pending > 0 then
		loading_status = "Project Diag : "
		for _, v in ipairs(pending) do
			loading_status = loading_status .. v .. " "
		end
	end
	return loading_status
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
	if vim.bo.filetype == "CHADTree" then
		return ""
	end
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

require("utils.statusline.codecompanion").init()
function CodeCompanionProgress()
	return require("utils.statusline.codecompanion").get_codecompanion_status()
end

function ChainsnowLogs()
	local count = require("chainsaw.visuals.statusline").countInBuffer()
	if string.len(count) > 0 then
		return "%#Label#|| " .. count .. " "
	end
	return ""
end
--============== update =============================
autocmd("LspProgress", {
	group = augroup("lsp"),
	callback = function()
		if vim.bo.filetype == "CHADTree" then
			return
		end
		vim.cmd("redrawstatus")
	end,
})

vim.o.statusline = table.concat({
	"%{%v:lua.StatuslineMode()%}",
	"%#StatusLineGit# %{%v:lua.GitBranch()%} %{%v:lua.GitFileStatus()%}",
	"%#StatuslineUnsaved#%{v:lua.HasUnsavedBuffers()}",
	"%=", -- Align center
	"%{%v:lua.GetLoadingProjectDiag()%}",
	"%#StatusLineInfo#%{%v:lua.DiagnosticsStatus()%}",
	"%{%v:lua.ChainsnowLogs()%}",
	"%=", -- Align right
	"%{%v:lua.CodeCompanionProgress()%}",
	"%{%v:lua.LspProgress()%}",
	"%#StatusLineLSP# %{v:lua.Formatter()} %{v:lua.Lsp()}",
	" %{&filetype}",
	"%{v:lua.StatuslineSelection()}",
	" %l:%c / %L",
})
