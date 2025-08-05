local M = {}
function M.setup()
	vim.lsp.config("postgres_lsp", {
		handlers = {
			["textDocument/publishDiagnostics"] = function(_, result, ctx, config)
				result.diagnostics = vim.tbl_filter(function(diagnostic)
					return diagnostic.message ~= 'Invalid statement: syntax error at or near ":"' -- example TypeScript diagnostic code
				end, result.diagnostics)
				vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx, config)
			end,
		},
	})
end
return M
