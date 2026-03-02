local M = {}
function M.setup()
	vim.lsp.config("cssmodules_ls", {
		cmd = { "bun", "run", "--bun", "cssmodules-language-server" },
	})
end
