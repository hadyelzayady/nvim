local M = {}
function M.goto_definition()
	-- if vim.bo.filetype == "yaml" then
	--   vim.lsp.buf.definition()
	--   return
	-- end
	vim.lsp.buf.definition()
	-- vim.cmd("Glance definitions")
end

function M.goto_references()
	-- vim.cmd("Trouble lsp_references")
	vim.lsp.buf.references()
end

function M.goto_type_definition()
	vim.lsp.buf.type_definition()
end

function M.goto_implementations()
	vim.lsp.buf.implementation()
end

function M.goto_file_references()
	local clients = require("utils.lsp").get_buffer_attached_lsp()
	if #clients > 0 then
		for _, client in ipairs(clients) do
			if client == "ts_ls" or client == "vtsls" then
				require("utils.lsp.commands").for_client(client).file_references()
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

function M.rename()
	vim.lsp.buf.rename()
end

function M.rename_file()
	local clientNames = require("utils.lsp").get_buffer_attached_lsp()

	if #clientNames > 0 then
		for _, clientName in ipairs(clientNames) do
			if clientName == "ts_ls" or clientName == "vtsls" then
				require("utils.lsp.commands").for_client(clientName).rename_file()
				return
			end
		end
	end
end

function M.addMissingImports()
	local clients = require("utils.lsp").get_buffer_attached_lsp()
	if #clients > 0 then
		for _, clientName in ipairs(clients) do
			if clientName == "ts_ls" or clientName == "vtsls" then
				require("utils.lsp.commands").add_missing_imports(clientName)
				return
			end
		end
	end
end

function M.removeUnusedImports()
	local clients = require("utils.lsp").get_buffer_attached_lsp()
	if #clients > 0 then
		for _, clientName in ipairs(clients) do
			if clientName == "ts_ls" or clientName == "vtsls" or clientName == "jdtls" then
				require("utils.lsp.commands").remove_unused_imports(clientName)
				break
			end
		end
	end
end

function M.removeUnused()
	local clients = require("utils.lsp").get_buffer_attached_lsp()
	if #clients > 0 then
		for _, clientName in ipairs(clients) do
			if clientName == "ts_ls" or clientName == "vtsls" then
				require("utils.lsp.commands").remove_unused(clientName)
				break
			end
		end
	end
end

function M.fixAll()
	local clients = require("utils.lsp").get_buffer_attached_lsp()
	if #clients > 0 then
		for _, clientName in ipairs(clients) do
			if clientName == "ts_ls" or clientName == "vtsls" or clientName == "eslint" or clientName == "biome" then
				require("utils.lsp.commands").fix_all(clientName)
			end
		end
	end
end

function M.toggle_inlay_hints()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end

function M.quickfix_document_diagnostics()
	local diagnostics = vim.diagnostic.get(0) -- 0 means the current buffer
	require("utils.lsp").populate_diagnostics_to_quickfix(diagnostics)
end
function M.quickfix_project_diagnostics()
	local diagnostics = vim.diagnostic.get() -- 0 means the current buffer
	require("utils.lsp").populate_diagnostics_to_quickfix(diagnostics)
end

function M.toggle_symbole_usages(global)
	if global then
		---@return boolean True if active, false otherwise
		require("symbol-usage").toggle_globally()
		return
	end
	require("symbol-usage").toggle()
end

return M
