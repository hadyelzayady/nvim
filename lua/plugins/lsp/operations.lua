local M = {}
function M.goto_definition()
	vim.lsp.buf.definition()
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
function M.goto_import_references() end

function M.goto_file_references()
	local clients = require("plugins.lsp.utils").get_buffer_attached_lsp()
	if #clients > 0 then
		for _, client in ipairs(clients) do
			if client == "vtsls" then
				require("vtsls").commands.file_references()
        break
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
	require("conform").format({ async = true, lsp_fallback = true})
end
function M.hover()

	vim.lsp.buf.hover()
end
function M.rename()

	vim.lsp.buf.rename()
end
return M
