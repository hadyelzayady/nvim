local M = {}
function M.goto_definition()
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
		end
	end
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
	vim.lsp.buf.hover()
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
				break
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
				break
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
		end
	end
end
function M.fixAll()
	local clients = require("utils.lsp").get_buffer_attached_lsp()
	if #clients > 0 then
		for _, client in ipairs(clients) do
			if client == "typescript-tools" then
				vim.cmd("TSToolsFixAll")
				return
			end
			if client == "eslint" then
				vim.cmd("EslintFixAll")
				return
			end
			if client == "rust_analyzer" then
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

function M.file_references()
	local clients = require("utils.lsp").get_buffer_attached_lsp()
	if #clients > 0 then
		for _, client in ipairs(clients) do
			if client == "typescript-tools" then
				local success, resp =
					pcall(client.request_sync, "fileReferences", { file = vim.api.nvim_buf_get_name(0) })
				return
			end
		end
	end
end
return M
