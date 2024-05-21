local M = {}
function M.goto_definition()
	-- vim.lsp.buf.definition()
	-- local clients = require("utils.lsp").get_buffer_attached_lsp()
	-- if #clients > 0 then
	-- 	for _, client in ipairs(clients) do
	-- 		if client == "yamlls" then
	-- 			vim.lsp.buf.definition()
	-- 			return
	-- 		end
	-- 	end
	-- end
	vim.cmd("Glance definitions")
end
function M.goto_references()
	vim.lsp.buf.references()
end
function M.goto_type_definition()
	vim.lsp.buf.type_definition()
end
function M.goto_implementations()
	vim.lsp.buf.implementation()
end
function M.goto_import_references()
	vim.lsp.buf.references(nil, {
		on_list = function(options)
			local items = options.items
			local uniqueFiles = require("utils.functions").removeDuplicates(items, function(item)
				return item.filename
			end)
			options.items = uniqueFiles
			vim.fn.setqflist({}, " ", options)
			vim.api.nvim_command("copen")
		end,
	})
end

function M.goto_file_references()
	local clients = require("utils.lsp").get_buffer_attached_lsp()
	if #clients > 0 then
		for _, client in ipairs(clients) do
			if client == "vtsls" then
				require("vtsls").commands.file_references()
				return
			end
			if client == "typescript-tools" then
				vim.cmd("TSToolsFileReferences")
				return
			end
		end
	end
	-- workaround
end

function M.goto_incoming_calls()
	vim.lsp.buf.incoming_calls()
end

function M.goto_outgoing_calls()
	vim.lsp.buf.outgoing_calls()
end

function M.goto_declaration()
	vim.lsp.buf.declaration()
end

function M.format()
	require("conform").format({ async = true, lsp_fallback = true })
end
function M.hover()
	local winid = require("ufo").peekFoldedLinesUnderCursor()
	if not winid then
		vim.lsp.buf.hover()
	end
end
function M.rename()
	vim.lsp.buf.rename()
end
function M.rename_file()
	local clients = require("utils.lsp").get_buffer_attached_lsp()
	if #clients > 0 then
		for _, client in ipairs(clients) do
			if client == "typescript-tools" then
				vim.cmd("TSToolsRenameFile")
				return
			end
		end
	end
end

function M.addMissingImports()
	local clients = require("utils.lsp").get_buffer_attached_lsp()
	if #clients > 0 then
		for _, client in ipairs(clients) do
			if client == "typescript-tools" then
				vim.cmd("TSToolsAddMissingImports")
				return
			end
			if client == "vtsls" then
				vim.cmd("VtsExec add_missing_imports")
				return
			end
		end
	end
end
function M.removeUnusedImports()
	local clients = require("utils.lsp").get_buffer_attached_lsp()
	if #clients > 0 then
		for _, client in ipairs(clients) do
			if client == "typescript-tools" then
				vim.cmd("TSToolsRemoveUnusedImports")
				break
			end
			if client == "vtsls" then
				require("vtsls").commands.remove_unused_imports()
				break
			end
		end
	end
end
function M.removeUnused()
	local clients = require("utils.lsp").get_buffer_attached_lsp()
	if #clients > 0 then
		for _, client in ipairs(clients) do
			if client == "typescript-tools" then
				vim.cmd("TSToolsRemoveUnused")
				break
			end
			if client == "vtsls" then
				require("vtsls").commands.remove_unused()
				break
			end
		end
	end
end

function M.fixAll()
	local clients = require("utils.lsp").get_buffer_attached_lsp()
	if #clients > 0 then
		for _, client in ipairs(clients) do
			if client == "typescript-tools" then
				vim.cmd("TSToolsFixAll")
			end
			if client == "eslint" then
				vim.cmd("EslintFixAll")
			end
			if client == "rust-analyzer" then
				require("utils.functions").os_capture("cargo fix --allow-dirty")
				vim.cmd("e")
				M.format()
				-- vim.lsp.buf.code_action({
				-- 	filter = function(a)
				-- 		return a.isPreferred
				-- 	end,
				-- 	apply = true,
				-- })
			end
		end
	end
end
function M.toggle_inlay_hints()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end
return M
