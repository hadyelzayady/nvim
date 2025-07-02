local M = {}

function M.setup()
	vim.lsp.config("biome", {
		cmd = { "bunx", "biome", "lsp-proxy" },
	})
end

return M
