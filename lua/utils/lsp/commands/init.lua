local o = require("utils.lsp.commands.config")
local async = require("utils.lsp.commands.async")
local rename = require("utils.lsp.commands.rename")
local compat = require("utils.lsp.commands.compat")

local M = {}
local clientName = nil
function M.for_client(name)
	clientName = name
	return M
end

local function get_client(bufnr)
	local clients = compat.lsp_get_clients({ bufnr = bufnr, name = clientName })
	if clients and clients[1] then
		return clients[1]
	end
end

local function exec_command(bufnr, client, command, args)
	return async.request(client, "workspace/executeCommand", {
		command = command,
		arguments = args,
	}, bufnr)
end

local function gen_buf_command(name, params, handler)
	handler = handler or function() end
	return function(bufnr, res, rej)
		bufnr = bufnr or vim.api.nvim_get_current_buf()
		res = res or o.get().default_resolve
		rej = rej or o.get().default_reject

		local client = get_client(bufnr)
		if not client then
			return rej("No client found")
		end
		async.exec(function()
			handler(exec_command(bufnr, client, name, params and params(bufnr, client)))
		end, res, rej)
	end
end

local function gen_win_command(name, params, handler)
	handler = handler or function() end
	return function(winnr, res, rej)
		winnr = winnr or vim.api.nvim_get_current_win()
		local bufnr = vim.api.nvim_win_get_buf(winnr)
		res = res or o.get().default_resolve
		rej = rej or o.get().default_reject

		local client = get_client(bufnr)
		if not client then
			return rej("No client found")
		end
		async.exec(function()
			handler(exec_command(bufnr, client, name, params and params(winnr, client)))
		end, res, rej)
	end
end

local function code_action(bufnr, client, kinds)
	if type(kinds) == "string" then
		kinds = { kinds }
	end
	local params = vim.lsp.util.make_text_document_params(bufnr)
	local diagnostics = vim.diagnostic.get(bufnr, {
		namespace = vim.lsp.diagnostic.get_namespace(client.id),
	})
	local lsp_diagnostics = vim.tbl_map(function(d)
		return {
			range = {
				start = {
					line = d.lnum,
					character = d.col,
				},
				["end"] = {
					line = d.end_lnum,
					character = d.end_col,
				},
			},
			severity = d.severity,
			message = d.message,
			source = d.source,
			code = d.code,
			data = d.user_data and (d.user_data.lsp or {}),
		}
	end, diagnostics)
	if client.name == "eslint" then
		return async.request(client, "workspace/executeCommand", {
			command = "eslint.applyAllFixes",
			arguments = {
				{
					uri = vim.uri_from_bufnr(bufnr),
					version = vim.lsp.util.buf_versions[bufnr],
				},
			},
		})
	end

	return async.request(client, "textDocument/codeAction", {
		textDocument = params,
		range = {
			start = {
				line = 0,
				character = 0,
			},
			["end"] = {
				line = vim.api.nvim_buf_line_count(bufnr),
				character = 0,
			},
		},
		context = {
			only = kinds,
			triggerKind = 1, -- vim.lsp.protocol.CodeActionTriggerKind.Invoked
			diagnostics = lsp_diagnostics,
		},
	}, bufnr)
end

local function gen_code_action(kinds)
	return function(bufnr, res, rej)
		bufnr = bufnr or vim.api.nvim_get_current_buf()
		res = res or o.get().default_resolve
		rej = rej or o.get().default_reject

		local client = get_client(bufnr)
		if not client then
			return rej("No client found")
		end

		async.exec(function()
			local handler = o.get().handlers.code_action
			handler(code_action(bufnr, client, kinds))
		end, res, rej)
	end
end

function M.rename_file(bufnr, res, rej)
	bufnr = bufnr or vim.api.nvim_get_current_buf()
	res = res or o.get().default_resolve
	rej = rej or o.get().default_reject

	local old_name = vim.api.nvim_buf_get_name(bufnr)
	async.exec(function()
		local new_name = async.call(vim.ui.input, { default = old_name })
		if not new_name then
			return
		end
		async.async_call_err(rename, old_name, new_name)
	end, res, rej)
end

M.restart_tsserver = gen_buf_command("typescript.restartTsServer")
M.open_tsserver_log = gen_buf_command("typescript.openTsServerLog")
M.reload_projects = gen_buf_command("typescript.reloadProjects")
M.select_ts_version = gen_buf_command("typescript.selectTypeScriptVersion")

M.goto_project_config = gen_buf_command("typescript.goToProjectConfig", function(bufnr)
	local params = vim.lsp.util.make_text_document_params(bufnr)
	return { params.uri }
end)

M.goto_source_definition = gen_win_command("typescript.goToSourceDefinition", function(winnr, client)
	local params = vim.lsp.util.make_position_params(winnr, client.offset_encoding)
	return { params.textDocument.uri, params.position }
end, o.get().handlers.source_definition)

M.file_references = gen_buf_command("typescript.findAllFileReferences", function(bufnr)
	local params = vim.lsp.util.make_text_document_params(bufnr)
	return { params.uri }
end, o.get().handlers.file_references)

local get_source_action_kinds = require("utils.lsp.commands.lsp-specific-commands").get_client_action
local source_action_kinds = require("utils.lsp.commands.lsp-specific-commands").source_action_kinds

M.organize_imports = function(name)
	clientName = name
	gen_code_action(get_source_action_kinds(name, "organize_imports"))()
end
M.sort_imports = function(name)
	clientName = name
	gen_code_action(get_source_action_kinds(name, "sort_imports"))()
end

M.remove_unused_imports = function(name)
	clientName = name
	gen_code_action(get_source_action_kinds(name, "remove_unused_imports"))()
end
M.fix_all = function(name)
	clientName = name
	gen_code_action(get_source_action_kinds(name, "fix_all"))()
end
M.remove_unused = function(name)
	clientName = name
	gen_code_action(get_source_action_kinds(name, "remove_unused"))()
end

M.add_missing_imports = function(name)
	clientName = name
	gen_code_action(get_source_action_kinds(name, "add_missing_imports"))()
end

M.source_actions = gen_code_action(vim.tbl_values(source_action_kinds))()

return M
