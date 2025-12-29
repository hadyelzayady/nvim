local M = {}
function M.setup()
	vim.lsp.config("eslint", {
		-- Add a condition to only run if an eslint config is found
		on_attach = function(client, bufnr)
			if
				not vim.fs.find(
					{ ".eslintrc.js", ".eslintrc.json", "package.json" },
					{ upward = true, path = vim.fn.expand("%:p:h") }
				)[1]
			then
				client.stop() -- Stop the server if no config is found
				return
			end
			-- rest of your on_attach function
		end,
	})
	-- vim.lsp.config("eslint", {})
end
return M
